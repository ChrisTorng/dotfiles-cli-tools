using ShSpecTests.Runtime;
using Xunit;

namespace ShSpecTests.Tests;

public sealed class SnippetsTests : ScriptTestBase
{
    public SnippetsTests() : base("snippets") { }

    [Fact(DisplayName = "snippets :: Output an existing snippet", Skip = "May require interaction or external tools")]
    public async Task OutputAnExistingSnippet()
    {
        await RunScriptAsync();
        var result = RequireLastCommand();
        AssertExitSuccess();
        Assert.NotEmpty(result.StandardOutput);
    }
}
