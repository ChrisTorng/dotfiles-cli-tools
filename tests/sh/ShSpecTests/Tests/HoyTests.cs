using System.Text.RegularExpressions;
using ShSpecTests.Runtime;
using Xunit;

namespace ShSpecTests.Tests;

public sealed class HoyTests : ScriptTestBase
{
    public HoyTests() : base("hoy") { }

    [Fact(DisplayName = "hoy :: Get today's date")]
    public async Task GetTodaysDate()
    {
        await RunScriptAsync();
        var result = RequireLastCommand();
        AssertExitSuccess();
        var output = result.StandardOutput.Trim();
        var dateRegex = new Regex(@"^\d{4}-\d{2}-\d{2}$");
        Assert.Matches(dateRegex, output);
        Assert.DoesNotContain("\n", result.StandardOutput);
    }
}
