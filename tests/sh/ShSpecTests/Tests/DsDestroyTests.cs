using ShSpecTests.Runtime;
using Xunit;

namespace ShSpecTests.Tests;

public sealed class DsDestroyTests : ScriptTestBase
{
    public DsDestroyTests() : base("ds-destroy") { }

    [Fact(DisplayName = "ds-destroy :: Delete macOS metadata files recursively", Skip = "May require interaction or external tools")]
    public async Task DeleteMacosMetadataFilesRecursively()
    {
        await RunScriptAsync();
        var result = RequireLastCommand();
        AssertExitSuccess();
        Assert.NotEmpty(result.StandardOutput);
    }
}
