using Xunit;

namespace ShSpecTests.Runtime;

public abstract class ScriptTestBase : IAsyncLifetime
{
    private readonly string _scriptName;
    private ScenarioContext? _context;

    protected ScriptTestBase(string scriptName)
    {
        _scriptName = scriptName;
    }

    public Task InitializeAsync()
    {
        var layout = RepositoryLayout.Discover();
        var runner = new ScriptRunner(layout);
        _context = new ScenarioContext(runner, CancellationToken.None);
        return Task.CompletedTask;
    }

    public Task DisposeAsync()
    {
        return Task.CompletedTask;
    }

    protected ScenarioContext Context => _context ?? throw new InvalidOperationException("Test not initialized");

    protected Task RunScriptAsync(params string[] arguments)
    {
        return Context.RunScriptAsync(_scriptName, arguments);
    }

    protected Task RunScriptWithInputAsync(string standardInput, params string[] arguments)
    {
        return Context.RunScriptWithInputAsync(_scriptName, standardInput, arguments);
    }

    protected CommandResult RequireLastCommand()
    {
        return Context.RequireLastCommand();
    }

    protected void AssertExitSuccess()
    {
        Context.AssertLastExitCodeSuccess();
    }

    protected void AssertExitCode(int expected)
    {
        Context.AssertLastExitCodeIs(expected);
    }
}
