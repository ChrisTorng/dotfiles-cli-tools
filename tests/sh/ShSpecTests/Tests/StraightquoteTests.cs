using ShSpecTests.Runtime;
using Xunit;

namespace ShSpecTests.Tests;

public sealed class StraightquoteTests : ScriptTestBase
{
    public StraightquoteTests() : base("straightquote") { }

    [Fact(DisplayName = "straightquote :: Normalize curly quotes")]
    public async Task NormalizeCurlyQuotes()
    {
        var input = "\u201CHello\u201D and \u2018world\u2019";
        await RunScriptWithInputAsync(input);
        var result = RequireLastCommand();
        AssertExitSuccess();
        Assert.Equal("\"Hello\" and 'world'", result.StandardOutputNormalized.Trim());
    }
}
