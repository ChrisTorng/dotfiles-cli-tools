using ShSpecTests.Runtime;
using Xunit;

namespace ShSpecTests.Tests;

public sealed class EmojiTests : ScriptTestBase
{
    public EmojiTests() : base("emoji") { }

    [Fact(DisplayName = "emoji :: List all emoji entries", Skip = "Requires external tools or interaction")]
    public async Task ListAllEmojiEntries()
    {
        await RunScriptAsync();
        var result = RequireLastCommand();
        AssertExitSuccess();
        Assert.NotEmpty(result.StandardOutput);
    }
}
