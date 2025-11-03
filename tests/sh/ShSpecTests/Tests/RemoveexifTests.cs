using ShSpecTests.Runtime;
using Xunit;

namespace ShSpecTests.Tests;

public sealed class RemoveexifTests : ScriptTestBase
{
    public RemoveexifTests() : base("removeexif") { }

    [Fact(DisplayName = "removeexif :: Strip EXIF data from images", Skip = "May require interaction or external tools")]
    public async Task StripExifDataFromImages()
    {
        await RunScriptAsync();
        var result = RequireLastCommand();
        AssertExitSuccess();
        Assert.NotEmpty(result.StandardOutput);
    }
}
