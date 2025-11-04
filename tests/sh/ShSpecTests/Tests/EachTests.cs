using ShSpecTests.Runtime;
using Xunit;

namespace ShSpecTests.Tests;

public sealed class EachTests : ScriptTestBase
{
    public EachTests() : base("each") { }

    [Fact(DisplayName = "each :: Execute a command for each line", Skip = "Interactive or long-running script")]
    public async Task ExecuteACommandForEachLine()
    {
        await RunScriptAsync();
        var result = RequireLastCommand();
        AssertExitSuccess();
        Assert.NotEmpty(result.StandardOutput);
    }
}
