using System.Collections.Immutable;

namespace ShSpecTests.Specs;

public enum StepKeyword
{
    Given,
    When,
    Then,
    And,
    But
}

public sealed record StepSpec(StepKeyword Keyword, string Text);

public sealed record ScenarioSpec(string Name, ImmutableArray<StepSpec> Steps);

public sealed record FeatureSpec(string Slug, string Title, string FilePath, ImmutableArray<ScenarioSpec> Scenarios);
