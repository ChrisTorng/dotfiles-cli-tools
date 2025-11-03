using ShSpecTests.Runtime;
using Xunit;

namespace ShSpecTests.Tests;

public sealed class ThemeTests : ScriptTestBase
{
    public ThemeTests() : base("theme") { }

    [Fact(DisplayName = "theme :: Apply theme changes", Skip = "May require interaction or external tools")]
    public async Task ApplyThemeChanges()
    {
        await RunScriptAsync();
        var result = RequireLastCommand();
        AssertExitSuccess();
        Assert.NotEmpty(result.StandardOutput);
    }
}
