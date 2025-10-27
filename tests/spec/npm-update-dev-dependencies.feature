Feature: npm-update-dev-dependencies script
  Updates devDependencies in package.json to their latest versions.

  Scenario: Update development dependencies to latest
    Given a Node.js project with devDependencies defined
    When I run "npm-update-dev-dependencies"
    Then the script computes each devDependency@latest and installs them with npm --save-dev
