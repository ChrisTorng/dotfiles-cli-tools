using ShSpecTests.Runtime;
using Xunit;

namespace ShSpecTests.Tests;

public sealed class AlphabetTests : ScriptTestBase
{
    public AlphabetTests() : base("alphabet") { }

    [Fact(DisplayName = "alphabet :: Show alphabets without arguments")]
    public async Task ShowAlphabetsWithoutArguments()
    {
        await RunScriptAsync();
        var result = RequireLastCommand();
        AssertExitSuccess();
        Assert.Contains("abcdefghijklmnopqrstuvwxyz", result.StandardOutput);
        Assert.Contains("ABCDEFGHIJKLMNOPQRSTUVWXYZ", result.StandardOutput);
    }
}
