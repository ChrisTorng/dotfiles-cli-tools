using ShSpecTests.Runtime;
using Xunit;

namespace ShSpecTests.Tests;

public sealed class TimerTests : ScriptTestBase
{
    public TimerTests() : base("timer") { }

    [Fact(DisplayName = "timer :: Run a timer for a number of seconds", Skip = "Interactive or long-running script")]
    public async Task RunATimerForANumberOfSeconds()
    {
        await RunScriptAsync();
        var result = RequireLastCommand();
        AssertExitSuccess();
        Assert.NotEmpty(result.StandardOutput);
    }
}
