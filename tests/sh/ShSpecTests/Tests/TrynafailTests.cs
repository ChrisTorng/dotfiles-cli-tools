using ShSpecTests.Runtime;
using Xunit;

namespace ShSpecTests.Tests;

public sealed class TrynafailTests : ScriptTestBase
{
    public TrynafailTests() : base("trynafail") { }

    [Fact(DisplayName = "trynafail :: Repeat a command until failure", Skip = "Interactive or long-running script")]
    public async Task RepeatACommandUntilFailure()
    {
        await RunScriptAsync();
        var result = RequireLastCommand();
        AssertExitSuccess();
        Assert.NotEmpty(result.StandardOutput);
    }
}
