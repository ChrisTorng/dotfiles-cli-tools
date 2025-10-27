namespace ShSpecTests.Runtime;

public sealed record CommandResult(int ExitCode, string StandardOutput, string StandardError)
{
    public string StandardOutputNormalized => StandardOutput.Replace("\r\n", "\n");
}
