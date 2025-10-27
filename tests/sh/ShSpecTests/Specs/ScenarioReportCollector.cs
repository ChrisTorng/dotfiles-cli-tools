using System.Collections.Concurrent;
using System.Text.Json;
using ShSpecTests.Runtime;

namespace ShSpecTests.Specs;

public static class ScenarioReportCollector
{
    private static readonly ConcurrentBag<ScenarioExecutionResult> Results = new();
    private static int _written;

    public static void Record(ScenarioExecutionResult result)
    {
        Results.Add(result);
    }

    public static void Persist(RepositoryLayout layout)
    {
        var reportPath = Path.Combine(layout.RepoRoot, "tests", "sh", "spec-report.json");
        var directory = Path.GetDirectoryName(reportPath);
        if (!string.IsNullOrEmpty(directory))
        {
            Directory.CreateDirectory(directory);
        }

        var ordered = Results
            .OrderBy(r => r.FeatureSlug, StringComparer.Ordinal)
            .ThenBy(r => r.ScenarioName, StringComparer.Ordinal)
            .ToArray();

        var json = JsonSerializer.Serialize(ordered, new JsonSerializerOptions
        {
            WriteIndented = true
        });

        File.WriteAllText(reportPath, json);
        Interlocked.Exchange(ref _written, 1);
    }

    public static bool HasReport => _written == 1;

    public static IReadOnlyCollection<ScenarioExecutionResult> CurrentResults => Results.ToArray();
}
