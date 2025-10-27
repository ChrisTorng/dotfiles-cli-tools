using System.Text.Json.Serialization;

namespace ShSpecTests.Specs;

public enum ScenarioStatus
{
    Passed,
    NotImplemented,
    Skipped,
    Failed
}

public sealed record ScenarioExecutionResult(
    string FeatureSlug,
    string ScenarioName,
    ScenarioStatus Status,
    string? Details)
{
    public static ScenarioExecutionResult Passed(string feature, string scenario) =>
        new(feature, scenario, ScenarioStatus.Passed, null);

    public static ScenarioExecutionResult NotImplemented(string feature, string scenario, string? ImplementationDetails) =>
        new(feature, scenario, ScenarioStatus.NotImplemented, ImplementationDetails);

    public static ScenarioExecutionResult Skipped(string feature, string scenario, string reason) =>
        new(feature, scenario, ScenarioStatus.Skipped, reason);

    public static ScenarioExecutionResult Failed(string feature, string scenario, string message) =>
        new(feature, scenario, ScenarioStatus.Failed, message);

    [JsonIgnore]
    public bool IsSuccessful => Status == ScenarioStatus.Passed;
}
