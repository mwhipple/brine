Feature: All Elements
  Assertions can be done against all elements of a structure.

  Scenario: List in response body
    When the request body is assigned:
      """
      ["a", "bb", "ccc"]
      """
    And a PUT is sent to `/anything`
    Then the value of the response body child `json` has elements which are all matching `/\w+/`

  Scenario: Spread nested lists
    When the request body is assigned:
      """
      [{"val": "foo"},{"val": "foo"}]
      """
    And a PUT is sent to `/anything`
    Then the value of the response body children `json..val` has elements which are all equal to `foo`
