Feature: mergepdfs script
  Combines multiple PDF files into one using Ghostscript.

  Scenario: Merge several PDFs
    Given multiple PDF files exist
    When I run "mergepdfs" with an output filename followed by the inputs
    Then the script uses Ghostscript to write a merged PDF to the specified output
    And the command exits successfully
