using ShSpecTests.Runtime;
using Xunit;

namespace ShSpecTests.Tests;

public sealed class ClsTests : ScriptTestBase
{
    public ClsTests() : base("cls") { }

    [Fact(DisplayName = "cls :: Clear the terminal")]
    public async Task ClearTheTerminal()
    {
        await RunScriptAsync();
        var result = RequireLastCommand();
        AssertExitSuccess();
    }
}
