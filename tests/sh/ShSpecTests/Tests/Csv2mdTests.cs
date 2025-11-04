using ShSpecTests.Runtime;
using Xunit;

namespace ShSpecTests.Tests;

public sealed class Csv2mdTests : ScriptTestBase
{
    public Csv2mdTests() : base("csv2md") { }

    [Fact(DisplayName = "csv2md :: Convert a CSV file", Skip = "May require interaction or external tools")]
    public async Task ConvertACsvFile()
    {
        await RunScriptAsync();
        var result = RequireLastCommand();
        AssertExitSuccess();
        Assert.NotEmpty(result.StandardOutput);
    }
}
