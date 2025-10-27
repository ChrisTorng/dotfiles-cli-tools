using ShSpecTests.Runtime;
using ShSpecTests.Specs;
using Xunit;
using Xunit.Sdk;

namespace ShSpecTests;

public sealed class SpecConformanceTests
{
    public static IEnumerable<object[]> ScenarioData()
    {
        var layout = RepositoryLayout.Discover();
        var features = SpecLoader.LoadFromDirectory(layout.SpecsDirectory);

        foreach (var feature in features)
        {
            foreach (var scenario in feature.Scenarios)
            {
                var implementation = ScenarioCatalog.Find(feature.Slug, scenario.Name);
                yield return new object[] { new ScenarioTestDefinition(feature, scenario, implementation) };
            }
        }
    }

    [Theory(DisplayName = "sh 規格符合性測試")]
    [MemberData(nameof(ScenarioData))]
    public async Task ExecuteScenarioAsync(ScenarioTestDefinition definition)
    {
        var layout = RepositoryLayout.Discover();
        var runner = new ScriptRunner(layout);

        var result = await definition.ExecuteAsync(runner, CancellationToken.None);
        ScenarioReportCollector.Record(result);
        ScenarioReportCollector.Persist(layout);

        if (result.Status == ScenarioStatus.Failed)
        {
            // 保留錯誤於報表中，最終回報時再彙整原因。
        }
    }
}
