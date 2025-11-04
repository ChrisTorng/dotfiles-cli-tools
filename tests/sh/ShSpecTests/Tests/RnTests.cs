using ShSpecTests.Runtime;
using Xunit;

namespace ShSpecTests.Tests;

public sealed class RnTests : ScriptTestBase
{
    public RnTests() : base("rn") { }

    [Fact(DisplayName = "rn :: Display time and calendar", Skip = "May require interaction or external tools")]
    public async Task DisplayTimeAndCalendar()
    {
        await RunScriptAsync();
        var result = RequireLastCommand();
        AssertExitSuccess();
        Assert.NotEmpty(result.StandardOutput);
        Assert.Contains(DateTime.Now.ToString("MMMM"), result.StandardOutput);
    }
}
