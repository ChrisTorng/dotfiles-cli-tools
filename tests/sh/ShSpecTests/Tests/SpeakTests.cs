using ShSpecTests.Runtime;
using Xunit;

namespace ShSpecTests.Tests;

public sealed class SpeakTests : ScriptTestBase
{
    public SpeakTests() : base("speak") { }

    [Fact(DisplayName = "speak :: Speak text using say", Skip = "May require interaction or external tools")]
    public async Task SpeakTextUsingSay()
    {
        await RunScriptAsync();
        var result = RequireLastCommand();
        AssertExitSuccess();
        Assert.NotEmpty(result.StandardOutput);
    }
}
