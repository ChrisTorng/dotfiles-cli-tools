using ShSpecTests.Runtime;
using Xunit;

namespace ShSpecTests.Tests;

public sealed class IsqlTests : ScriptTestBase
{
    public IsqlTests() : base("isql") { }

    [Fact(DisplayName = "isql :: Start SQLite in-memory session", Skip = "Interactive or long-running script")]
    public async Task StartSqliteInmemorySession()
    {
        await RunScriptAsync();
        var result = RequireLastCommand();
        AssertExitSuccess();
        Assert.NotEmpty(result.StandardOutput);
    }
}
