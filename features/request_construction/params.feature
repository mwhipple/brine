Feature: Adding Query Parameters

  Scenario: A single parameter is appended to the URL.
    When the request query parameter `foo` is assigned `bar`
    And a GET is sent to `/get`

    Then the value of the response body child `args` is equal to:
      """
      {"foo": "bar"}
      """

  Scenario: Multiple parameters are appended to the URL with proper formatting.
    When the request query parameter `foo` is assigned `bar`
    And the request query parameter `baz` is assigned `1`
    And a GET is sent to `/get`

    Then the value of the response body child `args` is equal to:
      """
      {"foo": "bar",
       "baz": "1"}
      """

  Scenario Outline: Values are encoded appropriately.
    When the request query parameter `foo` is assigned `<input>`
    And a GET is sent to `/get`

    Then the value of the response body child `args` is equal to:
      """
      {"foo": "<input>"}
      """

  Examples:
    | input         |
    | bar & grill   |
    | + +           |
    | (imbalance))  |

  Scenario Outline: Parametes are added regardless of HTTP method.
    When the request query parameter `foo` is assigned `bar`
    And a <method> is sent to `/anything`

    Then the value of the response body child `args` is equal to:
      """
      {"foo": "bar"}
      """

  Examples:
    | method  |
    | POST    |
    | PUT     |
    | DELETE  |
