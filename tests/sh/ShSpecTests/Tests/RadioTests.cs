using ShSpecTests.Runtime;
using Xunit;

namespace ShSpecTests.Tests;

public sealed class RadioTests : ScriptTestBase
{
    public RadioTests() : base("radio") { }

    [Fact(DisplayName = "radio :: Play a known station", Skip = "Interactive or long-running script")]
    public async Task PlayAKnownStation()
    {
        await RunScriptAsync();
        var result = RequireLastCommand();
        AssertExitSuccess();
        Assert.NotEmpty(result.StandardOutput);
    }
}
