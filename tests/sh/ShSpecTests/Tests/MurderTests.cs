using ShSpecTests.Runtime;
using Xunit;

namespace ShSpecTests.Tests;

public sealed class MurderTests : ScriptTestBase
{
    public MurderTests() : base("murder") { }

    [Fact(DisplayName = "murder :: Terminate a process by PID", Skip = "Requires external tools or interaction")]
    public async Task TerminateAProcessByPid()
    {
        await RunScriptAsync();
        var result = RequireLastCommand();
        AssertExitSuccess();
        Assert.NotEmpty(result.StandardOutput);
    }
}
