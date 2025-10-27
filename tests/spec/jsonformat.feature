Feature: jsonformat script
  Pretty-prints JSON input using available tools.

  Scenario: Format JSON using node
    Given node is installed
    When I pipe JSON into "jsonformat"
    Then the script prints the parsed JSON using util.inspect with colors

  Scenario: Fallback to jq
    Given node is not available but jq is installed
    When I pipe JSON into "jsonformat"
    Then the script formats the JSON with jq

  Scenario: Fallback to cat
    Given neither node nor jq is installed
    When I pipe JSON into "jsonformat"
    Then the script outputs the original content unchanged
