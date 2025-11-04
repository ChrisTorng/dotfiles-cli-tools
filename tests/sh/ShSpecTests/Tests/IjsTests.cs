using ShSpecTests.Runtime;
using Xunit;

namespace ShSpecTests.Tests;

public sealed class IjsTests : ScriptTestBase
{
    public IjsTests() : base("ijs") { }

    [Fact(DisplayName = "ijs :: Start a JavaScript REPL", Skip = "Interactive or long-running script")]
    public async Task StartAJavascriptRepl()
    {
        await RunScriptAsync();
        var result = RequireLastCommand();
        AssertExitSuccess();
        Assert.NotEmpty(result.StandardOutput);
    }
}
