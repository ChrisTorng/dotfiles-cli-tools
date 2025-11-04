using ShSpecTests.Runtime;
using Xunit;

namespace ShSpecTests.Tests;

public sealed class NpmUnusedTests : ScriptTestBase
{
    public NpmUnusedTests() : base("npm-unused") { }

    [Fact(DisplayName = "npm-unused :: Report unused dependencies", Skip = "May require interaction or external tools")]
    public async Task ReportUnusedDependencies()
    {
        await RunScriptAsync();
        var result = RequireLastCommand();
        AssertExitSuccess();
        Assert.NotEmpty(result.StandardOutput);
    }
}
