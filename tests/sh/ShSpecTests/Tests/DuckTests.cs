using ShSpecTests.Runtime;
using Xunit;

namespace ShSpecTests.Tests;

public sealed class DuckTests : ScriptTestBase
{
    public DuckTests() : base("duck") { }

    [Fact(DisplayName = "duck :: Open DuckDuckGo homepage", Skip = "Requires external tools or interaction")]
    public async Task OpenDuckduckgoHomepage()
    {
        await RunScriptAsync();
        var result = RequireLastCommand();
        AssertExitSuccess();
        Assert.NotEmpty(result.StandardOutput);
    }
}
