Feature: iclj script
  Starts a Leiningen REPL for the current Clojure project.

  Scenario: Launch Leiningen REPL
    Given Leiningen is installed
    When I run "iclj"
    Then the script starts "lein repl" in the current project context
