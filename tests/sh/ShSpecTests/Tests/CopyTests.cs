using ShSpecTests.Runtime;
using Xunit;

namespace ShSpecTests.Tests;

public sealed class CopyTests : ScriptTestBase
{
    public CopyTests() : base("copy") { }

    [Fact(DisplayName = "copy :: Copy piped text into the clipboard", Skip = "Requires external tools or interaction")]
    public async Task CopyPipedTextIntoTheClipboard()
    {
        await RunScriptAsync();
        var result = RequireLastCommand();
        AssertExitSuccess();
        Assert.NotEmpty(result.StandardOutput);
    }
}
