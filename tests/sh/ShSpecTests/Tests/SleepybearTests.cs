using ShSpecTests.Runtime;
using Xunit;

namespace ShSpecTests.Tests;

public sealed class SleepybearTests : ScriptTestBase
{
    public SleepybearTests() : base("sleepybear") { }

    [Fact(DisplayName = "sleepybear :: Sleep on macOS", Skip = "Interactive or long-running script")]
    public async Task SleepOnMacos()
    {
        await RunScriptAsync();
        var result = RequireLastCommand();
        AssertExitSuccess();
        Assert.NotEmpty(result.StandardOutput);
    }
}
