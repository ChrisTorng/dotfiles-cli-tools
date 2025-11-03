using ShSpecTests.Runtime;
using Xunit;

namespace ShSpecTests.Tests;

public sealed class WifiTests : ScriptTestBase
{
    public WifiTests() : base("wifi") { }

    [Fact(DisplayName = "wifi :: Show Wi-Fi status", Skip = "Requires external tools or interaction")]
    public async Task ShowWifiStatus()
    {
        await RunScriptAsync();
        var result = RequireLastCommand();
        AssertExitSuccess();
        Assert.NotEmpty(result.StandardOutput);
    }
}
