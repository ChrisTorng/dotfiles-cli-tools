using ShSpecTests.Runtime;
using Xunit;

namespace ShSpecTests.Tests;

public sealed class IpyTests : ScriptTestBase
{
    public IpyTests() : base("ipy") { }

    [Fact(DisplayName = "ipy :: Launch Python REPL", Skip = "Interactive or long-running script")]
    public async Task LaunchPythonRepl()
    {
        await RunScriptAsync();
        var result = RequireLastCommand();
        AssertExitSuccess();
        Assert.NotEmpty(result.StandardOutput);
    }
}
