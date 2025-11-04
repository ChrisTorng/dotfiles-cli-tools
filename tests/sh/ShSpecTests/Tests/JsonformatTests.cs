using ShSpecTests.Runtime;
using Xunit;

namespace ShSpecTests.Tests;

public sealed class JsonformatTests : ScriptTestBase
{
    public JsonformatTests() : base("jsonformat") { }

    [Fact(DisplayName = "jsonformat :: Format JSON using node", Skip = "May require interaction or external tools")]
    public async Task FormatJsonUsingNode()
    {
        await RunScriptAsync();
        var result = RequireLastCommand();
        AssertExitSuccess();
        Assert.NotEmpty(result.StandardOutput);
    }
}
