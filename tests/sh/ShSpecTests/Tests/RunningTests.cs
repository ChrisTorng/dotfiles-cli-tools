using ShSpecTests.Runtime;
using Xunit;

namespace ShSpecTests.Tests;

public sealed class RunningTests : ScriptTestBase
{
    public RunningTests() : base("running") { }

    [Fact(DisplayName = "running :: Show all running processes", Skip = "May require interaction or external tools")]
    public async Task ShowAllRunningProcesses()
    {
        await RunScriptAsync();
        var result = RequireLastCommand();
        AssertExitSuccess();
        Assert.NotEmpty(result.StandardOutput);
    }
}
