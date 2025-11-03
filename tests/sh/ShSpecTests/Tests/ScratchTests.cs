using ShSpecTests.Runtime;
using Xunit;

namespace ShSpecTests.Tests;

public sealed class ScratchTests : ScriptTestBase
{
    public ScratchTests() : base("scratch") { }

    [Fact(DisplayName = "scratch :: Edit a temporary scratch file", Skip = "Requires external tools or interaction")]
    public async Task EditATemporaryScratchFile()
    {
        await RunScriptAsync();
        var result = RequireLastCommand();
        AssertExitSuccess();
        Assert.NotEmpty(result.StandardOutput);
    }
}
