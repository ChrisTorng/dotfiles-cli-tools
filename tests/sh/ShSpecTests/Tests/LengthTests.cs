using ShSpecTests.Runtime;
using Xunit;

namespace ShSpecTests.Tests;

public sealed class LengthTests : ScriptTestBase
{
    public LengthTests() : base("length") { }

    [Fact(DisplayName = "length :: Count characters in text")]
    public async Task CountCharactersInText()
    {
        await RunScriptAsync("hello", "world");
        var result = RequireLastCommand();
        AssertExitSuccess();
        Assert.Equal("11", result.StandardOutputNormalized.Trim());
    }
}
