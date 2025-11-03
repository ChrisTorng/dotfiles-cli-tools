using ShSpecTests.Runtime;
using Xunit;

namespace ShSpecTests.Tests;

public sealed class ServeitTests : ScriptTestBase
{
    public ServeitTests() : base("serveit") { }

    [Fact(DisplayName = "serveit :: Serve files on default port", Skip = "Interactive or long-running script")]
    public async Task ServeFilesOnDefaultPort()
    {
        await RunScriptAsync();
        var result = RequireLastCommand();
        AssertExitSuccess();
        Assert.NotEmpty(result.StandardOutput);
    }
}
