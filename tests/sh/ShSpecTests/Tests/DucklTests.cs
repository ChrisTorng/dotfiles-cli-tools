using ShSpecTests.Runtime;
using Xunit;

namespace ShSpecTests.Tests;

public sealed class DucklTests : ScriptTestBase
{
    public DucklTests() : base("duckl") { }

    [Fact(DisplayName = "duckl :: Open DuckDuckGo Lite", Skip = "Requires external tools or interaction")]
    public async Task OpenDuckduckgoLite()
    {
        await RunScriptAsync();
        var result = RequireLastCommand();
        AssertExitSuccess();
        Assert.NotEmpty(result.StandardOutput);
    }
}
