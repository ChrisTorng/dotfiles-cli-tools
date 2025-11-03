using ShSpecTests.Runtime;
using Xunit;

namespace ShSpecTests.Tests;

public sealed class TrashTests : ScriptTestBase
{
    public TrashTests() : base("trash") { }

    [Fact(DisplayName = "trash :: Move files to trash on macOS", Skip = "May require interaction or external tools")]
    public async Task MoveFilesToTrashOnMacos()
    {
        await RunScriptAsync();
        var result = RequireLastCommand();
        AssertExitSuccess();
        Assert.NotEmpty(result.StandardOutput);
    }
}
