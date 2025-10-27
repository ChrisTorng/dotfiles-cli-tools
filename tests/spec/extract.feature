Feature: extract script
  Expands archive files into directories using the appropriate tool.

  Scenario: Extract supported archive formats
    Given a supported archive file exists
    When I run "extract" with the archive path
    Then the script detects the format and unpacks the contents into a directory
    And unsupported formats cause an error message and non-zero exit status
