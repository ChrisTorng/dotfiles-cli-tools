using ShSpecTests.Runtime;
using Xunit;

namespace ShSpecTests.Tests;

public sealed class DatesortTests : ScriptTestBase
{
    public DatesortTests() : base("datesort") { }

    [Fact(DisplayName = "datesort :: Review planned moves before confirmation", Skip = "May require interaction or external tools")]
    public async Task ReviewPlannedMovesBeforeConfirmation()
    {
        await RunScriptAsync();
        var result = RequireLastCommand();
        AssertExitSuccess();
        Assert.NotEmpty(result.StandardOutput);
    }
}
