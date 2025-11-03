using ShSpecTests.Runtime;
using Xunit;

namespace ShSpecTests.Tests;

public sealed class BbTests : ScriptTestBase
{
    public BbTests() : base("bb") { }

    [Fact(DisplayName = "bb :: Run a command in the background", Skip = "May require interaction or external tools")]
    public async Task RunACommandInTheBackground()
    {
        await RunScriptAsync();
        var result = RequireLastCommand();
        AssertExitSuccess();
        Assert.NotEmpty(result.StandardOutput);
    }
}
