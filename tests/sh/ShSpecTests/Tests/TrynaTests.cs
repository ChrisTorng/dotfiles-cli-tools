using ShSpecTests.Runtime;
using Xunit;

namespace ShSpecTests.Tests;

public sealed class TrynaTests : ScriptTestBase
{
    public TrynaTests() : base("tryna") { }

    [Fact(DisplayName = "tryna :: Retry a failing command until success", Skip = "Interactive or long-running script")]
    public async Task RetryAFailingCommandUntilSuccess()
    {
        await RunScriptAsync();
        var result = RequireLastCommand();
        AssertExitSuccess();
        Assert.NotEmpty(result.StandardOutput);
    }
}
