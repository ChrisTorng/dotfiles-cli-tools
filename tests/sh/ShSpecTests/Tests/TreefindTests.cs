using ShSpecTests.Runtime;
using Xunit;

namespace ShSpecTests.Tests;

public sealed class TreefindTests : ScriptTestBase
{
    public TreefindTests() : base("treefind") { }

    [Fact(DisplayName = "treefind :: Show entire tree by default", Skip = "May require interaction or external tools")]
    public async Task ShowEntireTreeByDefault()
    {
        await RunScriptAsync();
        var result = RequireLastCommand();
        AssertExitSuccess();
        Assert.NotEmpty(result.StandardOutput);
    }
}
