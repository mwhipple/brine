Feature: Equal To
  It can be asserted that a value is equal to another value.

  Scenario: String in response body
    When the request body is assigned:
      """
      foo
      """
    And a PUT is sent to `/anything`
    Then the value of the response body child `data` is equal to `foo`
    And the value of the response body child `data` is not equal to `foot`

  Scenario: Response Status
    When a GET is sent to `/status/404`
    Then the value of the response status is equal to `404`
    And the value of the response status is not equal to `200`

  Scenario: Object in response body
    When the request body is assigned:
      """
      {"foo": "bar"}
      """
    And a PUT is sent to `/anything`
    Then the value of the response body child `json` is equal to:
      """
      {"foo":"bar"}
      """
    And the value of the response body child `json` is not equal to:
      """
      {"foo": "baz"}
      """

  Scenario: List in response body
    When the request body is assigned `[1, "foo", true]`
    And a PUT is sent to `/anything`
    Then the value of the response body child `json` is equal to `[1, "foo", true]`
    And the value of the response body child `json` is not equal to `[1, "bar", true]`

  Scenario Outline: Objects must match completely
    When the request body is assigned `{"foo": "bar", "baz": 1}`
    And a PUT is sent to `/anything`
    Then the value of the response body child `json` is not equal to `<comparison>`

  Examples:
    | comparison                           |
    | {}                                   |
    | {"foo": "bar"}                       |
    | {"foo": "bar", "baz": 1, "extra": 2} |
    | {"foo": "bar", "baz": 2}             |
