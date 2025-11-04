using ShSpecTests.Runtime;
using Xunit;

namespace ShSpecTests.Tests;

public sealed class NotifyTests : ScriptTestBase
{
    public NotifyTests() : base("notify") { }

    [Fact(DisplayName = "notify :: Send a notification with title and message", Skip = "May require interaction or external tools")]
    public async Task SendANotificationWithTitleAndMessage()
    {
        await RunScriptAsync();
        var result = RequireLastCommand();
        AssertExitSuccess();
        Assert.NotEmpty(result.StandardOutput);
    }
}
