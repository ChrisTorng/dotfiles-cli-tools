using ShSpecTests.Runtime;
using Xunit;

namespace ShSpecTests.Tests;

public sealed class NagdTests : ScriptTestBase
{
    public NagdTests() : base("nagd") { }

    [Fact(DisplayName = "nagd :: Start recurring notifications", Skip = "May require interaction or external tools")]
    public async Task StartRecurringNotifications()
    {
        await RunScriptAsync();
        var result = RequireLastCommand();
        AssertExitSuccess();
        Assert.NotEmpty(result.StandardOutput);
    }
}
