using System.Text.RegularExpressions;
using ShSpecTests.Runtime;
using Xunit;

namespace ShSpecTests.Tests;

public sealed class UuidTests : ScriptTestBase
{
    public UuidTests() : base("uuid") { }

    [Fact(DisplayName = "uuid :: Generate a UUID")]
    public async Task GenerateUuid()
    {
        await RunScriptAsync();
        var result = RequireLastCommand();
        AssertExitSuccess();
        var output = result.StandardOutputNormalized.Trim();
        var uuidRegex = new Regex("^[a-f0-9]{8}-[a-f0-9]{4}-4[a-f0-9]{3}-[89ab][a-f0-9]{3}-[a-f0-9]{12}$", RegexOptions.IgnoreCase);
        Assert.Matches(uuidRegex, output);
    }
}
