using ShSpecTests.Runtime;
using Xunit;

namespace ShSpecTests.Tests;

public sealed class GetsongTests : ScriptTestBase
{
    public GetsongTests() : base("getsong") { }

    [Fact(DisplayName = "getsong :: Download best audio with default naming", Skip = "Requires external tools or interaction")]
    public async Task DownloadBestAudioWithDefaultNaming()
    {
        await RunScriptAsync();
        var result = RequireLastCommand();
        AssertExitSuccess();
        Assert.NotEmpty(result.StandardOutput);
    }
}
