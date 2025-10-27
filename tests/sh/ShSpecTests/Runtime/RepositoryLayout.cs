namespace ShSpecTests.Runtime;

public sealed class RepositoryLayout
{
    public RepositoryLayout(string repoRoot)
    {
        RepoRoot = repoRoot ?? throw new ArgumentNullException(nameof(repoRoot));
    }

    public string RepoRoot { get; }

    public string ShDirectory => Path.Combine(RepoRoot, "sh");

    public string SpecsDirectory => Path.Combine(RepoRoot, "tests", "spec");

    public static RepositoryLayout Discover()
    {
        var current = new DirectoryInfo(AppContext.BaseDirectory);
        while (current is not null)
        {
            var hasScripts = Directory.Exists(Path.Combine(current.FullName, "sh"));
            var hasSpecs = Directory.Exists(Path.Combine(current.FullName, "tests", "spec"));
            if (hasScripts && hasSpecs)
            {
                return new RepositoryLayout(current.FullName);
            }

            current = current.Parent;
        }

        throw new InvalidOperationException("Unable to locate repository root from test execution directory.");
    }
}
