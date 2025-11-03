using ShSpecTests.Runtime;
using Xunit;

namespace ShSpecTests.Tests;

public sealed class TunesTests : ScriptTestBase
{
    public TunesTests() : base("tunes") { }

    [Fact(DisplayName = "tunes :: Play audio-only streams", Skip = "Requires external tools or interaction")]
    public async Task PlayAudioonlyStreams()
    {
        await RunScriptAsync();
        var result = RequireLastCommand();
        AssertExitSuccess();
        Assert.NotEmpty(result.StandardOutput);
    }
}
