using ShSpecTests.Runtime;
using Xunit;

namespace ShSpecTests.Tests;

public sealed class GTests : ScriptTestBase
{
    public GTests() : base("g") { }

    [Fact(DisplayName = "g :: Show status when no arguments are provided")]
    public async Task ShowStatusWithoutArguments()
    {
        await RunScriptAsync();
        var result = RequireLastCommand();
        AssertExitSuccess();
    }

    [Fact(DisplayName = "g :: Forward git arguments")]
    public async Task ForwardGitArguments()
    {
        await RunScriptAsync("--version");
        var result = RequireLastCommand();
        AssertExitSuccess();
        Assert.Contains("git version", result.StandardOutput);
    }
}
