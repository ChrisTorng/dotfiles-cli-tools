using ShSpecTests.Runtime;
using Xunit;

namespace ShSpecTests.Tests;

public sealed class MergepdfsTests : ScriptTestBase
{
    public MergepdfsTests() : base("mergepdfs") { }

    [Fact(DisplayName = "mergepdfs :: Merge several PDFs", Skip = "May require interaction or external tools")]
    public async Task MergeSeveralPdfs()
    {
        await RunScriptAsync();
        var result = RequireLastCommand();
        AssertExitSuccess();
        Assert.NotEmpty(result.StandardOutput);
    }
}
