using ShSpecTests.Runtime;
using Xunit;

namespace ShSpecTests.Tests;

public sealed class PrettypathTests : ScriptTestBase
{
    public PrettypathTests() : base("prettypath") { }

    [Fact(DisplayName = "prettypath :: Display PATH entries line by line")]
    public async Task DisplayPathEntriesLineByLine()
    {
        await RunScriptAsync();
        var result = RequireLastCommand();
        AssertExitSuccess();
        var lines = result.StandardOutputNormalized.Split('\n', StringSplitOptions.RemoveEmptyEntries);
        Assert.True(lines.Length > 0, "Expected at least one PATH entry");
        Assert.DoesNotContain(":", lines[0]);
    }
}
