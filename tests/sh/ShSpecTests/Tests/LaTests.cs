using ShSpecTests.Runtime;
using Xunit;

namespace ShSpecTests.Tests;

public sealed class LaTests : ScriptTestBase
{
    public LaTests() : base("la") { }

    [Fact(DisplayName = "la :: List files with automatic color flag")]
    public async Task ListFilesWithAutomaticColorFlag()
    {
        await RunScriptAsync();
        var result = RequireLastCommand();
        AssertExitSuccess();
        Assert.NotEmpty(result.StandardOutput);
    }
}
