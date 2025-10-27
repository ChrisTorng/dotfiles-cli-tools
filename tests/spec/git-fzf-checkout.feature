Feature: git-fzf-checkout script
  Uses fzf to select a git branch interactively and check it out.

  Scenario: Choose a branch interactively
    Given a git repository with multiple branches
    When I run "git-fzf-checkout"
    Then the available branches are piped into fzf for selection
    And the selected branch is checked out via git checkout
