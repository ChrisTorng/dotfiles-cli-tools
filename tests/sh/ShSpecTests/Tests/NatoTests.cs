using ShSpecTests.Runtime;
using Xunit;

namespace ShSpecTests.Tests;

public sealed class NatoTests : ScriptTestBase
{
    public NatoTests() : base("nato") { }

    [Fact(DisplayName = "nato :: Spell text with NATO alphabet")]
    public async Task SpellTextWithNatoAlphabet()
    {
        await RunScriptAsync("Hi?");
        var result = RequireLastCommand();
        AssertExitSuccess();
        var lines = result.StandardOutputNormalized
            .Split('\n', StringSplitOptions.RemoveEmptyEntries | StringSplitOptions.TrimEntries);

        Assert.Collection(
            lines,
            line => Assert.Equal("Hotel", line),
            line => Assert.Equal("India", line),
            line => Assert.Equal("?", line));
    }
}
