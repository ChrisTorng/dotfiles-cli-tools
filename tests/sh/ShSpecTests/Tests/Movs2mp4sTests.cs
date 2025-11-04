using ShSpecTests.Runtime;
using Xunit;

namespace ShSpecTests.Tests;

public sealed class Movs2mp4sTests : ScriptTestBase
{
    public Movs2mp4sTests() : base("movs2mp4s") { }

    [Fact(DisplayName = "movs2mp4s :: Convert MOV files concurrently", Skip = "May require interaction or external tools")]
    public async Task ConvertMovFilesConcurrently()
    {
        await RunScriptAsync();
        var result = RequireLastCommand();
        AssertExitSuccess();
        Assert.NotEmpty(result.StandardOutput);
    }
}
