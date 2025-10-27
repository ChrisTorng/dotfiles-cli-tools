using System.Diagnostics;
using System.Text.RegularExpressions;

namespace ShSpecTests.Runtime;

public sealed class ScriptRunner
{
    private static readonly Regex EnvShebang = new("^/usr/bin/env\\s+(.+)$", RegexOptions.Compiled);
    private readonly RepositoryLayout _layout;

    public ScriptRunner(RepositoryLayout layout)
    {
        _layout = layout;
    }

    public async Task<CommandResult> RunAsync(string scriptName, IReadOnlyList<string> arguments, CancellationToken cancellationToken)
    {
        var scriptPath = Path.Combine(_layout.ShDirectory, scriptName);
        if (!File.Exists(scriptPath))
        {
            throw new FileNotFoundException($"Script '{scriptName}' was not found in '{_layout.ShDirectory}'.", scriptPath);
        }

        var interpreter = ResolveInterpreter(scriptPath);
        var startInfo = new ProcessStartInfo
        {
            FileName = interpreter.Command,
            RedirectStandardOutput = true,
            RedirectStandardError = true,
            UseShellExecute = false,
            WorkingDirectory = _layout.RepoRoot,
        };

        foreach (var arg in interpreter.Arguments)
        {
            startInfo.ArgumentList.Add(arg);
        }

        startInfo.ArgumentList.Add(scriptPath);

        foreach (var arg in arguments)
        {
            startInfo.ArgumentList.Add(arg);
        }

        using var process = new Process { StartInfo = startInfo };
        process.Start();

        var stdoutTask = process.StandardOutput.ReadToEndAsync(cancellationToken);
        var stderrTask = process.StandardError.ReadToEndAsync(cancellationToken);
        await process.WaitForExitAsync(cancellationToken);

        var stdout = await stdoutTask;
        var stderr = await stderrTask;

        return new CommandResult(process.ExitCode, stdout, stderr);
    }

    private static InterpreterSpec ResolveInterpreter(string scriptPath)
    {
        using var stream = new FileStream(scriptPath, FileMode.Open, FileAccess.Read, FileShare.Read);
        using var reader = new StreamReader(stream);
        var firstLine = reader.ReadLine();

        if (firstLine is null || !firstLine.StartsWith("#!"))
        {
            throw new InvalidOperationException($"Script '{scriptPath}' does not declare an interpreter.");
        }

        var declaration = firstLine.Substring(2).Trim();
        var envMatch = EnvShebang.Match(declaration);
        if (envMatch.Success)
        {
            var parts = SplitArguments(envMatch.Groups[1].Value);
            if (parts.Count == 0)
            {
                throw new InvalidOperationException($"Interpreter declaration '{declaration}' is invalid.");
            }

            return new InterpreterSpec(parts[0], parts.Skip(1).ToArray());
        }

        var directParts = SplitArguments(declaration);
        return new InterpreterSpec(directParts[0], directParts.Skip(1).ToArray());
    }

    private static IReadOnlyList<string> SplitArguments(string value)
    {
        var results = new List<string>();
        var current = new List<char>();
        var inQuotes = false;

        foreach (var ch in value)
        {
            if (ch == '"')
            {
                inQuotes = !inQuotes;
                continue;
            }

            if (char.IsWhiteSpace(ch) && !inQuotes)
            {
                if (current.Count > 0)
                {
                    results.Add(new string(current.ToArray()));
                    current.Clear();
                }

                continue;
            }

            current.Add(ch);
        }

        if (current.Count > 0)
        {
            results.Add(new string(current.ToArray()));
        }

        return results;
    }

    private sealed record InterpreterSpec(string Command, IReadOnlyList<string> Arguments);
}
