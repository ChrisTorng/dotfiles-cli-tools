using ShSpecTests.Runtime;
using Xunit;

namespace ShSpecTests.Tests;

public sealed class ExtensionsTests : ScriptTestBase
{
    public ExtensionsTests() : base("extensions") { }

    [Fact(DisplayName = "extensions :: Extract unique extensions", Skip = "May require interaction or external tools")]
    public async Task ExtractUniqueExtensions()
    {
        await RunScriptAsync();
        var result = RequireLastCommand();
        AssertExitSuccess();
        Assert.NotEmpty(result.StandardOutput);
    }
}
