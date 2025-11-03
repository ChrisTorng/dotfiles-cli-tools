using ShSpecTests.Runtime;
using Xunit;

namespace ShSpecTests.Tests;

public sealed class MkshTests : ScriptTestBase
{
    public MkshTests() : base("mksh") { }

    [Fact(DisplayName = "mksh :: Scaffold a new shell script", Skip = "May require interaction or external tools")]
    public async Task ScaffoldANewShellScript()
    {
        await RunScriptAsync();
        var result = RequireLastCommand();
        AssertExitSuccess();
        Assert.NotEmpty(result.StandardOutput);
    }
}
