using ShSpecTests.Runtime;
using Xunit;

namespace ShSpecTests.Tests;

public sealed class UrlTests : ScriptTestBase
{
    public UrlTests() : base("url") { }

    [Fact(DisplayName = "url :: Parse a full URL", Skip = "May require interaction or external tools")]
    public async Task ParseAFullUrl()
    {
        await RunScriptAsync();
        var result = RequireLastCommand();
        AssertExitSuccess();
        Assert.NotEmpty(result.StandardOutput);
    }
}
