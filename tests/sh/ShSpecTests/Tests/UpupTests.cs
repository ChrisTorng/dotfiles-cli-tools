using ShSpecTests.Runtime;
using Xunit;

namespace ShSpecTests.Tests;

public sealed class UpupTests : ScriptTestBase
{
    public UpupTests() : base("upup") { }

    [Fact(DisplayName = "upup :: Update supported package managers", Skip = "May require interaction or external tools")]
    public async Task UpdateSupportedPackageManagers()
    {
        await RunScriptAsync();
        var result = RequireLastCommand();
        AssertExitSuccess();
        Assert.NotEmpty(result.StandardOutput);
    }
}
