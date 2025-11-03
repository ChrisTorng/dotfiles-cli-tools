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
                // 只產生已實作的測試案例
                if (implementation is not null)
                {
                    yield return new object[] { new ScenarioTestDefinition(feature, scenario, implementation) };
                }
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
            Assert.Fail($"測試失敗: {result.Details}");
        }
        else if (result.Status == ScenarioStatus.NotImplemented)
        {
            Assert.Fail($"測試尚未實作: {result.Details}");
        }
        else if (result.Status == ScenarioStatus.Skipped)
        {
            // 使用 xUnit 的 Skip 功能
            throw new SkipException(result.Details ?? "測試被跳過");
        }
    }

    [Fact(DisplayName = "測試實作進度檢查")]
    public void CheckImplementationProgress()
    {
        var layout = RepositoryLayout.Discover();
        var features = SpecLoader.LoadFromDirectory(layout.SpecsDirectory);

        int totalScenarios = 0;
        int implementedScenarios = 0;
        var notImplementedList = new List<string>();

        foreach (var feature in features)
        {
            foreach (var scenario in feature.Scenarios)
            {
                totalScenarios++;
                var implementation = ScenarioCatalog.Find(feature.Slug, scenario.Name);
                if (implementation is not null)
                {
                    implementedScenarios++;
                }
                else
                {
                    notImplementedList.Add($"  - {feature.Slug} :: {scenario.Name}");
                }
            }
        }

        var notImplementedCount = totalScenarios - implementedScenarios;
        var progressMessage = $"測試實作進度: {implementedScenarios}/{totalScenarios} ({(implementedScenarios * 100.0 / totalScenarios):F1}%)\n" +
                            $"尚未實作: {notImplementedCount} 個測試\n";

        if (notImplementedCount > 0)
        {
            // 列出前 10 個未實作的測試作為範例
            var exampleCount = Math.Min(10, notImplementedList.Count);
            progressMessage += $"\n未實作測試範例（前 {exampleCount} 個）:\n" + 
                             string.Join("\n", notImplementedList.Take(exampleCount));
            
            if (notImplementedList.Count > exampleCount)
            {
                progressMessage += $"\n  ... 還有 {notImplementedList.Count - exampleCount} 個未列出";
            }

            Assert.Fail(progressMessage);
        }
    }
}
