using ShSpecTests.Runtime;
using Xunit;

namespace ShSpecTests.Tests;

public sealed class HttpstatusTests : ScriptTestBase
{
    public HttpstatusTests() : base("httpstatus") { }

    [Fact(DisplayName = "httpstatus :: Show all HTTP status codes", Skip = "May require interaction or external tools")]
    public async Task ShowAllHttpStatusCodes()
    {
        await RunScriptAsync();
        var result = RequireLastCommand();
        AssertExitSuccess();
        Assert.NotEmpty(result.StandardOutput);
    }
}
