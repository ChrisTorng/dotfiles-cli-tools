using ShSpecTests.Runtime;
using Xunit;

namespace ShSpecTests.Tests;

public sealed class MarkdownquoteTests : ScriptTestBase
{
    public MarkdownquoteTests() : base("markdownquote") { }

    [Fact(DisplayName = "markdownquote :: Quote input text")]
    public async Task QuoteInputText()
    {
        var input = "Hello\n\nWorld";
        await RunScriptWithInputAsync(input);
        var result = RequireLastCommand();
        AssertExitSuccess();
        var lines = result.StandardOutputNormalized.Split('\n', StringSplitOptions.RemoveEmptyEntries);
        Assert.Equal("> Hello", lines[0]);
        Assert.Equal(">", lines[1]);
        Assert.Equal("> World", lines[2]);
    }
}
