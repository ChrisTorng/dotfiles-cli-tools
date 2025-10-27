Feature: npm-unused script
  Detects dependencies declared in package.json that are not required in the codebase.

  Scenario: Report unused dependencies
    Given a Node.js project with package.json dependencies
    When I run "npm-unused"
    Then the script checks git history for require statements and lists packages with no matches
    And the command exits non-zero when unused dependencies are found

  Scenario: Confirm all dependencies are used
    Given every dependency is referenced in the codebase
    When I run "npm-unused"
    Then the script prints "all good!" and exits successfully
