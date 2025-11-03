using ShSpecTests.Runtime;
using Xunit;

namespace ShSpecTests.Tests;

public sealed class ViewTests : ScriptTestBase
{
    public ViewTests() : base("view") { }

    [Fact(DisplayName = "view :: Open file read-only in nvim", Skip = "Requires external tools or interaction")]
    public async Task OpenFileReadonlyInNvim()
    {
        await RunScriptAsync();
        var result = RequireLastCommand();
        AssertExitSuccess();
        Assert.NotEmpty(result.StandardOutput);
    }
}
