using ShSpecTests.Runtime;
using Xunit;

namespace ShSpecTests.Tests;

public sealed class PastasTests : ScriptTestBase
{
    public PastasTests() : base("pastas") { }

    [Fact(DisplayName = "pastas :: Continuously display clipboard updates", Skip = "May require interaction or external tools")]
    public async Task ContinuouslyDisplayClipboardUpdates()
    {
        await RunScriptAsync();
        var result = RequireLastCommand();
        AssertExitSuccess();
        Assert.NotEmpty(result.StandardOutput);
    }
}
