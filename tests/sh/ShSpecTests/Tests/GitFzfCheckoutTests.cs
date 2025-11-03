using ShSpecTests.Runtime;
using Xunit;

namespace ShSpecTests.Tests;

public sealed class GitFzfCheckoutTests : ScriptTestBase
{
    public GitFzfCheckoutTests() : base("git-fzf-checkout") { }

    [Fact(DisplayName = "git-fzf-checkout :: Choose a branch interactively", Skip = "Requires external tools or interaction")]
    public async Task ChooseABranchInteractively()
    {
        await RunScriptAsync();
        var result = RequireLastCommand();
        AssertExitSuccess();
        Assert.NotEmpty(result.StandardOutput);
    }
}
