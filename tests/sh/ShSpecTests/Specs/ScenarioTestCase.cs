using ShSpecTests.Runtime;

namespace ShSpecTests.Specs;

public sealed record ScenarioTestCase(string FeatureSlug, string ScenarioName, Func<ScenarioContext, Task>? ExecuteAsync, string? SkipReason)
{
    public static ScenarioTestCase Create(string featureSlug, string scenarioName, Func<ScenarioContext, Task> executeAsync) =>
        new(featureSlug, scenarioName, executeAsync, null);

    public static ScenarioTestCase Skip(string featureSlug, string scenarioName, string reason) =>
        new(featureSlug, scenarioName, null, reason);
}
