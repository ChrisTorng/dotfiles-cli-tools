using ShSpecTests.Runtime;
using Xunit;

namespace ShSpecTests.Tests;

public sealed class PixTests : ScriptTestBase
{
    public PixTests() : base("pix") { }

    [Fact(DisplayName = "pix :: Show images in mpv", Skip = "Requires external tools or interaction")]
    public async Task ShowImagesInMpv()
    {
        await RunScriptAsync();
        var result = RequireLastCommand();
        AssertExitSuccess();
        Assert.NotEmpty(result.StandardOutput);
    }
}
