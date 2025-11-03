using ShSpecTests.Runtime;
using Xunit;

namespace ShSpecTests.Tests;

public sealed class ClockTests : ScriptTestBase
{
    public ClockTests() : base("clock") { }

    [Fact(DisplayName = "clock :: Show a ticking clock", Skip = "Interactive or long-running script")]
    public async Task ShowATickingClock()
    {
        await RunScriptAsync();
        var result = RequireLastCommand();
        AssertExitSuccess();
        Assert.NotEmpty(result.StandardOutput);
    }
}
