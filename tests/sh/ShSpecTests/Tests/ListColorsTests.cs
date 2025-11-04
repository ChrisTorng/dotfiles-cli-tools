using ShSpecTests.Runtime;
using Xunit;

namespace ShSpecTests.Tests;

public sealed class ListColorsTests : ScriptTestBase
{
    public ListColorsTests() : base("list-colors") { }

    [Fact(DisplayName = "list-colors :: Show the color palette", Skip = "May require interaction or external tools")]
    public async Task ShowTheColorPalette()
    {
        await RunScriptAsync();
        var result = RequireLastCommand();
        AssertExitSuccess();
        Assert.NotEmpty(result.StandardOutput);
    }
}
