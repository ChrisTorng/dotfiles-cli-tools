using ShSpecTests.Runtime;
using Xunit;

namespace ShSpecTests.Tests;

public sealed class WaitforTests : ScriptTestBase
{
    public WaitforTests() : base("waitfor") { }

    [Fact(DisplayName = "waitfor :: Wait for a process using platform tools", Skip = "Interactive or long-running script")]
    public async Task WaitForAProcessUsingPlatformTools()
    {
        await RunScriptAsync();
        var result = RequireLastCommand();
        AssertExitSuccess();
        Assert.NotEmpty(result.StandardOutput);
    }
}
