Feature: Empty
  It can be asserted that a value is empty.

  Scenario: Empty body is empty.
    When the request body is assigned ``
    And a PUT is sent to `/anything`
    Then the value of the response body child `data` is empty

  Scenario: Whitespace-only body is empty.
    When the request body is assigned:
      """
             
      """
    And a PUT is sent to `/anything`
    Then the value of the response body child `data` is empty

  Scenario: Empty string is empty.
    When the request body is assigned `""`
    And a PUT is sent to `/anything`
    Then the value of the response body child `data` is empty

  Scenario: Non-empty string is not empty.
    When the request body is assigned `blah`
    And a PUT is sent to `/anything`
    Then the value of the response body child `data` is not empty

  Scenario: Quoted whitespace is not empty.
    When the request body is assigned `" "`
    And a PUT is sent to `/anything`
    Then the value of the response body child `data` is not empty

  Scenario: Empty arrays are empty.
    When the request body is assigned `[]`
    And a PUT is sent to `/anything`
    Then the value of the response body child `json` is empty

  Scenario: Non-empty arrays are not empty.
    When the request body is assigned `[[]]`
    And a PUT is sent to `/anything`
    Then the value of the response body child `json` is not empty

  Scenario: Empty objects are empty.
    When the request body is assigned `{}`
    And a PUT is sent to `/anything`
    Then the value of the response body child `json` is empty

  Scenario: Non-empty objects are not empty.
    When the request body is assigned `{"foo":{}}`
    And a PUT is sent to `/anything`
    Then the value of the response body child `json` is not empty

  Scenario: Null values are empty.
    When the request body is assigned `{"foo": null}`
    And a PUT is sent to `/anything`
    Then the value of the response body child `json.foo` is empty

  Scenario: False is not empty.
    When the request body is assigned `{"foo": false}`
    And a PUT is sent to `/anything`
    Then the value of the response body child `json.foo` is not empty

  Scenario: 0 is not empty.
    When the request body is assigned `0`
    And a PUT is sent to `/anything`
    Then the value of the response body child `json` is not empty

