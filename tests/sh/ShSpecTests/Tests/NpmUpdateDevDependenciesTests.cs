using ShSpecTests.Runtime;
using Xunit;

namespace ShSpecTests.Tests;

public sealed class NpmUpdateDevDependenciesTests : ScriptTestBase
{
    public NpmUpdateDevDependenciesTests() : base("npm-update-dev-dependencies") { }

    [Fact(DisplayName = "npm-update-dev-dependencies :: Update development dependencies to latest", Skip = "May require interaction or external tools")]
    public async Task UpdateDevelopmentDependenciesToLatest()
    {
        await RunScriptAsync();
        var result = RequireLastCommand();
        AssertExitSuccess();
        Assert.NotEmpty(result.StandardOutput);
    }
}
