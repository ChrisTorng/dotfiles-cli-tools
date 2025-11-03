using ShSpecTests.Runtime;
using Xunit;

namespace ShSpecTests.Tests;

public sealed class UpperedTests : ScriptTestBase
{
    public UpperedTests() : base("uppered") { }

    [Fact(DisplayName = "uppered :: Uppercase stdin content")]
    public async Task UppercaseStdinContent()
    {
        await RunScriptWithInputAsync("hello world");
        var result = RequireLastCommand();
        AssertExitSuccess();
        Assert.Equal("HELLO WORLD", result.StandardOutputNormalized.Trim());
    }
}
