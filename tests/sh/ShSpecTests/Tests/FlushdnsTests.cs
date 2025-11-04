using ShSpecTests.Runtime;
using Xunit;

namespace ShSpecTests.Tests;

public sealed class FlushdnsTests : ScriptTestBase
{
    public FlushdnsTests() : base("flushdns") { }

    [Fact(DisplayName = "flushdns :: Flush DNS on macOS", Skip = "May require interaction or external tools")]
    public async Task FlushDnsOnMacos()
    {
        await RunScriptAsync();
        var result = RequireLastCommand();
        AssertExitSuccess();
        Assert.NotEmpty(result.StandardOutput);
    }
}
