using ShSpecTests.Runtime;
using Xunit;

namespace ShSpecTests.Tests;

public sealed class NpmUpdateDependenciesTests : ScriptTestBase
{
    public NpmUpdateDependenciesTests() : base("npm-update-dependencies") { }

    [Fact(DisplayName = "npm-update-dependencies :: Update dependencies to latest", Skip = "May require interaction or external tools")]
    public async Task UpdateDependenciesToLatest()
    {
        await RunScriptAsync();
        var result = RequireLastCommand();
        AssertExitSuccess();
        Assert.NotEmpty(result.StandardOutput);
    }
}
