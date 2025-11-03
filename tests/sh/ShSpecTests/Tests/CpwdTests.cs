using ShSpecTests.Runtime;
using Xunit;

namespace ShSpecTests.Tests;

public sealed class CpwdTests : ScriptTestBase
{
    public CpwdTests() : base("cpwd") { }

    [Fact(DisplayName = "cpwd :: Copy the current directory path", Skip = "Requires external tools or interaction")]
    public async Task CopyTheCurrentDirectoryPath()
    {
        await RunScriptAsync();
        var result = RequireLastCommand();
        AssertExitSuccess();
        Assert.NotEmpty(result.StandardOutput);
    }
}
