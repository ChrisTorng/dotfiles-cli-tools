using ShSpecTests.Runtime;
using Xunit;

namespace ShSpecTests.Tests;

public sealed class TuividTests : ScriptTestBase
{
    public TuividTests() : base("tuivid") { }

    [Fact(DisplayName = "tuivid :: Display video in terminal mode", Skip = "Requires external tools or interaction")]
    public async Task DisplayVideoInTerminalMode()
    {
        await RunScriptAsync();
        var result = RequireLastCommand();
        AssertExitSuccess();
        Assert.NotEmpty(result.StandardOutput);
    }
}
