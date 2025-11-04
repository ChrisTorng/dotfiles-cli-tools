using System.Text.RegularExpressions;
using ShSpecTests.Runtime;
using Xunit;

namespace ShSpecTests.Tests;

public sealed class PingenTests : ScriptTestBase
{
    public PingenTests() : base("pingen") { }

    [Fact(DisplayName = "pingen :: Generate default length PIN")]
    public async Task GenerateDefaultLengthPin()
    {
        await RunScriptAsync();
        var result = RequireLastCommand();
        AssertExitSuccess();
        var output = result.StandardOutputNormalized.Trim();
        Assert.Matches(new Regex(@"^\d{6}$"), output);
    }

    [Fact(DisplayName = "pingen :: Generate custom length PIN")]
    public async Task GenerateCustomLengthPin()
    {
        await RunScriptAsync("4");
        var result = RequireLastCommand();
        AssertExitSuccess();
        var output = result.StandardOutputNormalized.Trim();
        Assert.Matches(new Regex(@"^\d{4}$"), output);
    }
}
