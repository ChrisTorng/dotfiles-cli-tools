using System.Collections.Immutable;
using System.Text.RegularExpressions;

namespace ShSpecTests.Specs;

public static class SpecLoader
{
    private static readonly Regex ScenarioRegex = new("^Scenario:\\s*(.+)$", RegexOptions.Compiled);

    public static ImmutableArray<FeatureSpec> LoadFromDirectory(string directory)
    {
        if (!Directory.Exists(directory))
        {
            throw new DirectoryNotFoundException($"Unable to locate feature directory '{directory}'.");
        }

        var features = ImmutableArray.CreateBuilder<FeatureSpec>();

        foreach (var file in Directory.EnumerateFiles(directory, "*.feature", SearchOption.TopDirectoryOnly).OrderBy(f => f))
        {
            features.Add(ParseFeature(file));
        }

        return features.ToImmutable();
    }

    private static FeatureSpec ParseFeature(string filePath)
    {
        var lines = File.ReadAllLines(filePath);
        string? title = null;
        var scenarios = ImmutableArray.CreateBuilder<ScenarioSpec>();
        string? currentScenario = null;
        var currentSteps = ImmutableArray.CreateBuilder<StepSpec>();
        StepKeyword? lastKeyword = null;

        foreach (var rawLine in lines)
        {
            var line = rawLine.Trim();
            if (string.IsNullOrWhiteSpace(line))
            {
                continue;
            }

            if (line.StartsWith("Feature:", StringComparison.OrdinalIgnoreCase))
            {
                title = line.Substring("Feature:".Length).Trim();
                continue;
            }

            var scenarioMatch = ScenarioRegex.Match(line);
            if (scenarioMatch.Success)
            {
                CommitScenario();
                currentScenario = scenarioMatch.Groups[1].Value.Trim();
                continue;
            }

            if (TryParseStep(line, out var keyword, out var text))
            {
                lastKeyword = keyword == StepKeyword.And || keyword == StepKeyword.But ? lastKeyword ?? StepKeyword.And : keyword;
                currentSteps.Add(new StepSpec(keyword == StepKeyword.And || keyword == StepKeyword.But ? lastKeyword!.Value : keyword, text));
            }
        }

        CommitScenario();

        if (title is null)
        {
            throw new InvalidOperationException($"Feature file '{filePath}' is missing a title.");
        }

        var slug = Path.GetFileNameWithoutExtension(filePath);
        return new FeatureSpec(slug, title, filePath, scenarios.ToImmutable());

        void CommitScenario()
        {
            if (currentScenario is not null)
            {
                scenarios.Add(new ScenarioSpec(currentScenario, currentSteps.ToImmutable()));
                currentScenario = null;
                currentSteps = ImmutableArray.CreateBuilder<StepSpec>();
                lastKeyword = null;
            }
        }
    }

    private static bool TryParseStep(string line, out StepKeyword keyword, out string text)
    {
        foreach (StepKeyword candidate in Enum.GetValues<StepKeyword>())
        {
            var prefix = candidate switch
            {
                StepKeyword.Given => "Given ",
                StepKeyword.When => "When ",
                StepKeyword.Then => "Then ",
                StepKeyword.And => "And ",
                StepKeyword.But => "But ",
                _ => string.Empty
            };

            if (line.StartsWith(prefix, StringComparison.OrdinalIgnoreCase))
            {
                keyword = candidate;
                text = line.Substring(prefix.Length).Trim();
                return true;
            }
        }

        keyword = StepKeyword.And;
        text = string.Empty;
        return false;
    }
}
