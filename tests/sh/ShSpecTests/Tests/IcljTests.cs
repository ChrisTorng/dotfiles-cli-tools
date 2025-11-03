using ShSpecTests.Runtime;
using Xunit;

namespace ShSpecTests.Tests;

public sealed class IcljTests : ScriptTestBase
{
    public IcljTests() : base("iclj") { }

    [Fact(DisplayName = "iclj :: Launch Leiningen REPL", Skip = "Interactive or long-running script")]
    public async Task LaunchLeiningenRepl()
    {
        await RunScriptAsync();
        var result = RequireLastCommand();
        AssertExitSuccess();
        Assert.NotEmpty(result.StandardOutput);
    }
}
