Feature: npm-update-dependencies script
  Updates package.json dependencies to their latest versions.

  Scenario: Update dependencies to latest
    Given a Node.js project with dependencies defined
    When I run "npm-update-dependencies"
    Then the script computes each dependency@latest and installs them with npm --save
