Feature: Of Length
  It can be asserted that a value has a provided length.

  Scenario: String
    When the request body is assigned:
      """
      blah
      """
    And a PUT is sent to `/anything`
    Then the value of the response body child `data` is of length `4`

  Scenario: Array
    When the request body is assigned:
      """
      ["foo", "blah"]
      """
    And a PUT is sent to `/anything`
    Then the value of the response body child `json` is of length `2`

  Scenario: Map
    When the request body is assigned:
      """
      {"foo": "blah"}
      """
    And a PUT is sent to `/anything`
    Then the value of the response body child `json` is of length `1`

  Scenario: Value without length attribute
    When the request body is assigned:
      """
      true
      """
    And a PUT is sent to `/anything`
    Then the value of the response body child `json` is not of length `1`
    And the value of the response body child `json` is not of length `4`
    And the value of the response body child `json` is not of length `0`
