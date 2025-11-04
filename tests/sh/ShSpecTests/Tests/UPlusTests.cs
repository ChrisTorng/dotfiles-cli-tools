using ShSpecTests.Runtime;
using Xunit;

namespace ShSpecTests.Tests;

public sealed class UPlusTests : ScriptTestBase
{
    public UPlusTests() : base("u+") { }

    [Fact(DisplayName = "u+ :: Look up a Unicode code point")]
    public async Task LookupUnicodeCodePoint()
    {
        await RunScriptAsync("41");
        var result = RequireLastCommand();
        AssertExitSuccess();
        var lines = result.StandardOutputNormalized.Split('\n', StringSplitOptions.RemoveEmptyEntries | StringSplitOptions.TrimEntries);
        Assert.True(lines.Length >= 2, "Expected character and name output.");
        Assert.Equal("A", lines[0]);
        Assert.Equal("LATIN CAPITAL LETTER A", lines[1]);
    }
}
