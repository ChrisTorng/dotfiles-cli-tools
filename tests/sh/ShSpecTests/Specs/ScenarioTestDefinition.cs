using ShSpecTests.Runtime;
using Xunit;
using Xunit.Sdk;

namespace ShSpecTests.Specs;

public sealed class ScenarioTestDefinition
{
    public ScenarioTestDefinition(FeatureSpec feature, ScenarioSpec scenario, ScenarioTestCase? implementation)
    {
        Feature = feature;
        Scenario = scenario;
        Implementation = implementation;
    }

    public FeatureSpec Feature { get; }

    public ScenarioSpec Scenario { get; }

    public ScenarioTestCase? Implementation { get; }

    public async Task<ScenarioExecutionResult> ExecuteAsync(ScriptRunner runner, CancellationToken cancellationToken)
    {
        if (Implementation is null)
        {
            return ScenarioExecutionResult.NotImplemented(Feature.Slug, Scenario.Name, ImplementationDetails: "尚未撰寫對應的測試實作。");
        }

        if (Implementation.SkipReason is { Length: > 0 } reason)
        {
            return ScenarioExecutionResult.Skipped(Feature.Slug, Scenario.Name, reason);
        }

        var context = new ScenarioContext(runner, cancellationToken);
        try
        {
            await Implementation.ExecuteAsync!(context);
            return ScenarioExecutionResult.Passed(Feature.Slug, Scenario.Name);
        }
        catch (XunitException assertion)
        {
            return ScenarioExecutionResult.Failed(Feature.Slug, Scenario.Name, assertion.Message);
        }
        catch (Exception ex)
        {
            return ScenarioExecutionResult.Failed(Feature.Slug, Scenario.Name, ex.ToString());
        }
    }

    public override string ToString() => $"{Feature.Slug} :: {Scenario.Name}";
}
