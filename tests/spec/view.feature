Feature: view script
  Opens files in read-only mode using the configured editor.

  Scenario: Open file read-only in nvim
    Given the EDITOR environment variable is nvim
    When I run "view" with a file path
    Then the script launches nvim -R with the file

  Scenario: Open file read-only in vim
    Given the EDITOR environment variable is not nvim
    When I run "view" with a file path
    Then the script launches vim -R with the file
