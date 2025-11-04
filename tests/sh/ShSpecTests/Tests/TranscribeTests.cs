using ShSpecTests.Runtime;
using Xunit;

namespace ShSpecTests.Tests;

public sealed class TranscribeTests : ScriptTestBase
{
    public TranscribeTests() : base("transcribe") { }

    [Fact(DisplayName = "transcribe :: Transcribe provided audio files", Skip = "Requires external tools or interaction")]
    public async Task TranscribeProvidedAudioFiles()
    {
        await RunScriptAsync();
        var result = RequireLastCommand();
        AssertExitSuccess();
        Assert.NotEmpty(result.StandardOutput);
    }
}
