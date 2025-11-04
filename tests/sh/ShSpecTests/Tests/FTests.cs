using ShSpecTests.Runtime;
using Xunit;

namespace ShSpecTests.Tests;

public sealed class FTests : ScriptTestBase
{
    public FTests() : base("f") { }

    [Fact(DisplayName = "f :: Search using grep shorthand")]
    public async Task SearchUsingGrepShorthand()
    {
        var input = "hello\nworld\ntest";
        await RunScriptWithInputAsync(input, "world");
        var result = RequireLastCommand();
        AssertExitSuccess();
        Assert.Contains("world", result.StandardOutput);
        Assert.DoesNotContain("hello", result.StandardOutput);
    }
}
