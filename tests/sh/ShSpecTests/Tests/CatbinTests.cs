using ShSpecTests.Runtime;
using Xunit;

namespace ShSpecTests.Tests;

public sealed class CatbinTests : ScriptTestBase
{
    public CatbinTests() : base("catbin") { }

    [Fact(DisplayName = "catbin :: Inspect an executable in the PATH", Skip = "May require interaction or external tools")]
    public async Task InspectAnExecutableInThePath()
    {
        await RunScriptAsync();
        var result = RequireLastCommand();
        AssertExitSuccess();
        Assert.NotEmpty(result.StandardOutput);
    }
}
