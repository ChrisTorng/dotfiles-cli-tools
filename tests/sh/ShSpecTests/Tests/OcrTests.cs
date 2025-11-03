using ShSpecTests.Runtime;
using Xunit;

namespace ShSpecTests.Tests;

public sealed class OcrTests : ScriptTestBase
{
    public OcrTests() : base("ocr") { }

    [Fact(DisplayName = "ocr :: Recognize text from an image", Skip = "May require interaction or external tools")]
    public async Task RecognizeTextFromAnImage()
    {
        await RunScriptAsync();
        var result = RequireLastCommand();
        AssertExitSuccess();
        Assert.NotEmpty(result.StandardOutput);
    }
}
