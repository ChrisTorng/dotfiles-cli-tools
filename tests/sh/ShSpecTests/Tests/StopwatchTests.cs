using ShSpecTests.Runtime;
using Xunit;

namespace ShSpecTests.Tests;

public sealed class StopwatchTests : ScriptTestBase
{
    public StopwatchTests() : base("stopwatch") { }

    [Fact(DisplayName = "stopwatch :: Time the duration of input", Skip = "Interactive or long-running script")]
    public async Task TimeTheDurationOfInput()
    {
        await RunScriptAsync();
        var result = RequireLastCommand();
        AssertExitSuccess();
        Assert.NotEmpty(result.StandardOutput);
    }
}
