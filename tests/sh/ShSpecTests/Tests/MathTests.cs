using ShSpecTests.Runtime;
using Xunit;

namespace ShSpecTests.Tests;

public sealed class MathTests : ScriptTestBase
{
    public MathTests() : base("math") { }

    [Fact(DisplayName = "math :: Prefer rink when available", Skip = "Interactive or long-running script")]
    public async Task PreferRinkWhenAvailable()
    {
        await RunScriptAsync();
        var result = RequireLastCommand();
        AssertExitSuccess();
        Assert.NotEmpty(result.StandardOutput);
    }
}
