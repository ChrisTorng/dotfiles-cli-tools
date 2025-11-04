using ShSpecTests.Runtime;
using Xunit;

namespace ShSpecTests.Tests;

public sealed class LTests : ScriptTestBase
{
    public LTests() : base("l") { }

    [Fact(DisplayName = "l :: List directory contents")]
    public async Task ListDirectoryContents()
    {
        await RunScriptAsync("-1");
        var result = RequireLastCommand();
        AssertExitSuccess();
        Assert.NotEmpty(result.StandardOutput);
    }
}
