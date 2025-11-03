using ShSpecTests.Runtime;
using Xunit;

namespace ShSpecTests.Tests;

public sealed class GetsubsTests : ScriptTestBase
{
    public GetsubsTests() : base("getsubs") { }

    [Fact(DisplayName = "getsubs :: Download and print subtitles", Skip = "Requires external tools or interaction")]
    public async Task DownloadAndPrintSubtitles()
    {
        await RunScriptAsync();
        var result = RequireLastCommand();
        AssertExitSuccess();
        Assert.NotEmpty(result.StandardOutput);
    }
}
