using ShSpecTests.Runtime;
using Xunit;

namespace ShSpecTests.Tests;

public sealed class LineTests : ScriptTestBase
{
    public LineTests() : base("line") { }

    [Fact(DisplayName = "line :: Print the requested line number")]
    public async Task PrintRequestedLineNumber()
    {
        var input = "line1\nline2\nline3\nline4";
        await RunScriptWithInputAsync(input, "3");
        var result = RequireLastCommand();
        AssertExitSuccess();
        Assert.Equal("line3", result.StandardOutputNormalized.Trim());
    }
}
