using System.Collections.Immutable;
using System.Text.RegularExpressions;
using ShSpecTests.Runtime;
using Xunit;

namespace ShSpecTests.Specs;

public static class ScenarioCatalog
{
    private static readonly ImmutableDictionary<(string Feature, string Scenario), ScenarioTestCase> ScenarioMap =
        BuildScenarioMap();

    public static ScenarioTestCase? Find(string featureSlug, string scenarioName)
    {
        ScenarioMap.TryGetValue((featureSlug, scenarioName), out var testCase);
        return testCase;
    }

    private static ImmutableDictionary<(string Feature, string Scenario), ScenarioTestCase> BuildScenarioMap()
    {
        var builder = ImmutableDictionary.CreateBuilder<(string Feature, string Scenario), ScenarioTestCase>();

        builder.Add(("alphabet", "Show alphabets without arguments"),
            ScenarioTestCase.Create("alphabet", "Show alphabets without arguments", async context =>
            {
                await context.RunScriptAsync("alphabet");
                var result = context.RequireLastCommand();
                context.AssertLastExitCodeSuccess();
                Assert.Contains("abcdefghijklmnopqrstuvwxyz", result.StandardOutput);
                Assert.Contains("ABCDEFGHIJKLMNOPQRSTUVWXYZ", result.StandardOutput);
            }));

        builder.Add(("u+", "Look up a Unicode code point"),
            ScenarioTestCase.Create("u+", "Look up a Unicode code point", async context =>
            {
                await context.RunScriptAsync("u+", "41");
                var result = context.RequireLastCommand();
                context.AssertLastExitCodeSuccess();
                var lines = result.StandardOutputNormalized.Split('\n', StringSplitOptions.RemoveEmptyEntries | StringSplitOptions.TrimEntries);
                Assert.True(lines.Length >= 2, "Expected character and name output.");
                Assert.Equal("A", lines[0]);
                Assert.Equal("LATIN CAPITAL LETTER A", lines[1]);
            }));

        builder.Add(("uuid", "Generate a UUID"),
            ScenarioTestCase.Create("uuid", "Generate a UUID", async context =>
            {
                await context.RunScriptAsync("uuid");
                var result = context.RequireLastCommand();
                context.AssertLastExitCodeSuccess();
                var output = result.StandardOutputNormalized.Trim();
                var uuidRegex = new Regex("^[a-f0-9]{8}-[a-f0-9]{4}-4[a-f0-9]{3}-[89ab][a-f0-9]{3}-[a-f0-9]{12}$", RegexOptions.IgnoreCase);
                Assert.Matches(uuidRegex, output);
            }));

        builder.Add(("nato", "Spell text with NATO alphabet"),
            ScenarioTestCase.Create("nato", "Spell text with NATO alphabet", async context =>
            {
                await context.RunScriptAsync("nato", "Hi?");
                var result = context.RequireLastCommand();
                context.AssertLastExitCodeSuccess();
                var lines = result.StandardOutputNormalized
                    .Split('\n', StringSplitOptions.RemoveEmptyEntries | StringSplitOptions.TrimEntries);

                // 依照規格，每個字元應該各自占一行並採用 NATO 發音。
                Assert.Collection(
                    lines,
                    line => Assert.Equal("Hotel", line),
                    line => Assert.Equal("India", line),
                    line => Assert.Equal("?", line));
            }));

        return builder.ToImmutable();
    }
}
