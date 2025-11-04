using ShSpecTests.Runtime;
using Xunit;

namespace ShSpecTests.Tests;

public sealed class ExtractTests : ScriptTestBase
{
    public ExtractTests() : base("extract") { }

    [Fact(DisplayName = "extract :: Extract supported archive formats", Skip = "May require interaction or external tools")]
    public async Task ExtractSupportedArchiveFormats()
    {
        await RunScriptAsync();
        var result = RequireLastCommand();
        AssertExitSuccess();
        Assert.NotEmpty(result.StandardOutput);
    }
}
