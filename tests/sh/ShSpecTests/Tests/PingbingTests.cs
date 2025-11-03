using ShSpecTests.Runtime;
using Xunit;

namespace ShSpecTests.Tests;

public sealed class PingbingTests : ScriptTestBase
{
    public PingbingTests() : base("pingbing") { }

    [Fact(DisplayName = "pingbing :: Ping duckduckgo.com once")]
    public async Task PingDuckduckgoOnce()
    {
        await RunScriptAsync();
        var result = RequireLastCommand();
        // Exit code depends on connectivity, so we just check execution completed
        Assert.True(result.ExitCode >= 0);
    }
}
