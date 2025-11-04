using ShSpecTests.Runtime;
using Xunit;

namespace ShSpecTests.Tests;

public sealed class SnippetTests : ScriptTestBase
{
    public SnippetTests() : base("snippet") { }

    [Fact(DisplayName = "snippet :: Run snippets helper", Skip = "May require interaction or external tools")]
    public async Task RunSnippetsHelper()
    {
        await RunScriptAsync();
        var result = RequireLastCommand();
        AssertExitSuccess();
        Assert.NotEmpty(result.StandardOutput);
    }
}
