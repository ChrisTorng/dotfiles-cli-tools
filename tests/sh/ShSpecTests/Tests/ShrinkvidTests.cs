using ShSpecTests.Runtime;
using Xunit;

namespace ShSpecTests.Tests;

public sealed class ShrinkvidTests : ScriptTestBase
{
    public ShrinkvidTests() : base("shrinkvid") { }

    [Fact(DisplayName = "shrinkvid :: Compress a video with default CRF", Skip = "May require interaction or external tools")]
    public async Task CompressAVideoWithDefaultCrf()
    {
        await RunScriptAsync();
        var result = RequireLastCommand();
        AssertExitSuccess();
        Assert.NotEmpty(result.StandardOutput);
    }
}
