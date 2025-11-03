using ShSpecTests.Runtime;
using Xunit;

namespace ShSpecTests.Tests;

public sealed class MyipTests : ScriptTestBase
{
    public MyipTests() : base("myip") { }

    [Fact(DisplayName = "myip :: Show local IP", Skip = "May require interaction or external tools")]
    public async Task ShowLocalIp()
    {
        await RunScriptAsync();
        var result = RequireLastCommand();
        AssertExitSuccess();
        Assert.NotEmpty(result.StandardOutput);
    }
}
