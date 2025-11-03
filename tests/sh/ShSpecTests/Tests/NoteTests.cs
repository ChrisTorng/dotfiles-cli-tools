using ShSpecTests.Runtime;
using Xunit;

namespace ShSpecTests.Tests;

public sealed class NoteTests : ScriptTestBase
{
    public NoteTests() : base("note") { }

    [Fact(DisplayName = "note :: Create a daily note in the notes folder", Skip = "Requires external tools or interaction")]
    public async Task CreateADailyNoteInTheNotesFolder()
    {
        await RunScriptAsync();
        var result = RequireLastCommand();
        AssertExitSuccess();
        Assert.NotEmpty(result.StandardOutput);
    }
}
