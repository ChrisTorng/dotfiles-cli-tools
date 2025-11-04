using ShSpecTests.Runtime;
using Xunit;

namespace ShSpecTests.Tests;

public sealed class CptmpTests : ScriptTestBase
{
    public CptmpTests() : base("cptmp") { }

    [Fact(DisplayName = "cptmp :: Generate a temporary file path", Skip = "Requires copy command which depends on clipboard")]
    public async Task GenerateTemporaryFilePath()
    {
        await RunScriptAsync();
        var result = RequireLastCommand();
        AssertExitSuccess();
        var path = result.StandardOutputNormalized.Trim();
        Assert.StartsWith("/tmp/", path);
    }
}
