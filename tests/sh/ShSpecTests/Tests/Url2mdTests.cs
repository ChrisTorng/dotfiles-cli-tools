using ShSpecTests.Runtime;
using Xunit;

namespace ShSpecTests.Tests;

public sealed class Url2mdTests : ScriptTestBase
{
    public Url2mdTests() : base("url2md") { }

    [Fact(DisplayName = "url2md :: Convert a URL to Markdown", Skip = "Requires external tools or interaction")]
    public async Task ConvertAUrlToMarkdown()
    {
        await RunScriptAsync();
        var result = RequireLastCommand();
        AssertExitSuccess();
        Assert.NotEmpty(result.StandardOutput);
    }
}
