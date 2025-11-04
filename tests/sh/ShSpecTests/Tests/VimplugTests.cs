using ShSpecTests.Runtime;
using Xunit;

namespace ShSpecTests.Tests;

public sealed class VimplugTests : ScriptTestBase
{
    public VimplugTests() : base("vimplug") { }

    [Fact(DisplayName = "vimplug :: Install vim-plug for Neovim", Skip = "May require interaction or external tools")]
    public async Task InstallVimplugForNeovim()
    {
        await RunScriptAsync();
        var result = RequireLastCommand();
        AssertExitSuccess();
        Assert.NotEmpty(result.StandardOutput);
    }
}
