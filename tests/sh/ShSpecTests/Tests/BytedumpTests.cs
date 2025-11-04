using ShSpecTests.Runtime;
using Xunit;

namespace ShSpecTests.Tests;

public sealed class BytedumpTests : ScriptTestBase
{
    public BytedumpTests() : base("bytedump") { }

    [Fact(DisplayName = "bytedump :: Dump bytes with default options", Skip = "Requires external tools or interaction")]
    public async Task DumpBytesWithDefaultOptions()
    {
        await RunScriptAsync();
        var result = RequireLastCommand();
        AssertExitSuccess();
        Assert.NotEmpty(result.StandardOutput);
    }
}
