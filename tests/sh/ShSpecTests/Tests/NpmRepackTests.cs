using ShSpecTests.Runtime;
using Xunit;

namespace ShSpecTests.Tests;

public sealed class NpmRepackTests : ScriptTestBase
{
    public NpmRepackTests() : base("npm-repack") { }

    [Fact(DisplayName = "npm-repack :: Repack an npm package", Skip = "May require interaction or external tools")]
    public async Task RepackAnNpmPackage()
    {
        await RunScriptAsync();
        var result = RequireLastCommand();
        AssertExitSuccess();
        Assert.NotEmpty(result.StandardOutput);
    }
}
