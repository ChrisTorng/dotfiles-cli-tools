using ShSpecTests.Runtime;
using Xunit;

namespace ShSpecTests.Tests;

public sealed class GetpodTests : ScriptTestBase
{
    public GetpodTests() : base("getpod") { }

    [Fact(DisplayName = "getpod :: Fetch audio as an MP3", Skip = "Requires external tools or interaction")]
    public async Task FetchAudioAsAnMp3()
    {
        await RunScriptAsync();
        var result = RequireLastCommand();
        AssertExitSuccess();
        Assert.NotEmpty(result.StandardOutput);
    }
}
