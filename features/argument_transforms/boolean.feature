Feature: Boolean
  An argument that could represent a boolean value will be transformed into a boolean type.

  Scenario Outline: Docstring simple value.
    When the request body is assigned:
      """
      <input>
      """
    And a PUT is sent to `/anything`
    Then the value of the response body child `json` is a valid `Boolean`
    And the value of the response body child `json` is equal to `<input>`

  Examples:
    | input     |
    | true      |
# This produces an empty PUT, should be handled by selection of assigned values
#    | false     |

  Scenario Outline: Inline simple value.
    When the request body is assigned `<input>`
    And a PUT is sent to `/anything`
    Then the value of the response body child `json` is a valid `Boolean`
    And the value of the response body child `json` is equal to `<input>`

  Examples:
    | input     |
    | true      |
# This produces an empty PUT, should be handled by selection of assigned values
#    | false     |
