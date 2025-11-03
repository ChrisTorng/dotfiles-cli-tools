using ShSpecTests.Runtime;
using Xunit;

namespace ShSpecTests.Tests;

public sealed class PastaTests : ScriptTestBase
{
    public PastaTests() : base("pasta") { }

    [Fact(DisplayName = "pasta :: Read clipboard contents", Skip = "May require interaction or external tools")]
    public async Task ReadClipboardContents()
    {
        await RunScriptAsync();
        var result = RequireLastCommand();
        AssertExitSuccess();
        Assert.NotEmpty(result.StandardOutput);
    }
}
