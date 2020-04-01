Feature: Any Element
  Assertions can be done against any element of a structure.

  Scenario: Nested list in response body
    When the request body is assigned:
      """
      ["a", "b", "c"]
      """
    And a PUT is sent to `/anything`
    Then the value of the response body child `json` does have any element that is equal to `a`
    And the value of the response body child `json` does not have any element that is equal to `d`

  Scenario: Map matches entries
    When the request body is assigned:
      """
      {"a": 1, "b": 2}
      """
    #Equality will match keys
    And a PUT is sent to `/anything`
    Then the value of the response body child `json` does have any element that is equal to `a`
    And the value of the response body child `json` does not have any element that is equal to `d`

  Scenario: Spread nested lists
    When the request body is assigned:
      """
      [{"val":"foo"},{"val":"bar"}]
      """
    And a PUT is sent to `/anything`
    Then the value of the response body children `json..val` does have any element that is equal to `foo`
    And the value of the response body children `json..val` does not have any element that is equal to `other`
