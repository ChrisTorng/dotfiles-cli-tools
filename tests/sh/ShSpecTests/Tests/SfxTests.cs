using ShSpecTests.Runtime;
using Xunit;

namespace ShSpecTests.Tests;

public sealed class SfxTests : ScriptTestBase
{
    public SfxTests() : base("sfx") { }

    [Fact(DisplayName = "sfx :: Play a named sound effect", Skip = "Requires external tools or interaction")]
    public async Task PlayANamedSoundEffect()
    {
        await RunScriptAsync();
        var result = RequireLastCommand();
        AssertExitSuccess();
        Assert.NotEmpty(result.StandardOutput);
    }
}
