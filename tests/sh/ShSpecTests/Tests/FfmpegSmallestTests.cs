using ShSpecTests.Runtime;
using Xunit;

namespace ShSpecTests.Tests;

public sealed class FfmpegSmallestTests : ScriptTestBase
{
    public FfmpegSmallestTests() : base("ffmpeg-smallest") { }

    [Fact(DisplayName = "ffmpeg-smallest :: Convert to several formats and keep the smallest", Skip = "May require interaction or external tools")]
    public async Task ConvertToSeveralFormatsAndKeepTheSmallest()
    {
        await RunScriptAsync();
        var result = RequireLastCommand();
        AssertExitSuccess();
        Assert.NotEmpty(result.StandardOutput);
    }
}
