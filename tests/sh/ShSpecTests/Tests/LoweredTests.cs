using ShSpecTests.Runtime;
using Xunit;

namespace ShSpecTests.Tests;

public sealed class LoweredTests : ScriptTestBase
{
    public LoweredTests() : base("lowered") { }

    [Fact(DisplayName = "lowered :: Lowercase stdin content")]
    public async Task LowercaseStdinContent()
    {
        await RunScriptWithInputAsync("HELLO WORLD");
        var result = RequireLastCommand();
        AssertExitSuccess();
        Assert.Equal("hello world", result.StandardOutputNormalized.Trim());
    }
}
