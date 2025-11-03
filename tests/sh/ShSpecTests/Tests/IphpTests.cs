using ShSpecTests.Runtime;
using Xunit;

namespace ShSpecTests.Tests;

public sealed class IphpTests : ScriptTestBase
{
    public IphpTests() : base("iphp") { }

    [Fact(DisplayName = "iphp :: Open the PHP REPL", Skip = "Interactive or long-running script")]
    public async Task OpenThePhpRepl()
    {
        await RunScriptAsync();
        var result = RequireLastCommand();
        AssertExitSuccess();
        Assert.NotEmpty(result.StandardOutput);
    }
}
