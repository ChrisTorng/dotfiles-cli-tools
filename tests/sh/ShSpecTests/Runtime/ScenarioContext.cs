using Xunit;

namespace ShSpecTests.Runtime;

public sealed class ScenarioContext
{
    private readonly ScriptRunner _runner;
    private readonly CancellationToken _cancellationToken;

    public ScenarioContext(ScriptRunner runner, CancellationToken cancellationToken)
    {
        _runner = runner;
        _cancellationToken = cancellationToken;
    }

    public CommandResult? LastCommand { get; private set; }

    public async Task RunScriptAsync(string scriptName, params string[] arguments)
    {
        LastCommand = await _runner.RunAsync(scriptName, arguments, _cancellationToken);
    }

    public async Task RunScriptWithInputAsync(string scriptName, string standardInput, params string[] arguments)
    {
        LastCommand = await _runner.RunAsync(scriptName, arguments, _cancellationToken, standardInput);
    }

    public CommandResult RequireLastCommand()
    {
        return LastCommand ?? throw new InvalidOperationException("No command has been executed yet in this scenario.");
    }

    public void AssertLastExitCodeIs(int expected)
    {
        var result = RequireLastCommand();
        Assert.Equal(expected, result.ExitCode);
    }

    public void AssertLastExitCodeSuccess()
    {
        AssertLastExitCodeIs(0);
    }
}
