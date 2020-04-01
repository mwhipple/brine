@169
Feature: Regular Expression
  An argument that is enclosed in slashes (/) will be transformed into a regex.

  Scenario Outline: Docstring simple value.
    When the request body is assigned:
      """
      <input>
      """
    And a PUT is sent to `/anything`
    Then the value of the response body child `data` is equal to:
      """
      <expected>
      """

  #Expecting Ruby stringification and using painful escaping
  Examples:
    | input             | expected                                            |
    | //                | ""(?-mix:)""                                        |
    | /\//              | ""(?-mix:\\\\\\/)""                                 |
    | /.*/              | ""(?-mix:.*)""                                      |
    | /"[[:alpha:]]?"/  | ""(?-mix:\\"[[:alpha:]]?\\")""                      |
    | /foo bar/         | ""(?-mix:foo bar)""                                 |

  Scenario Outline: Inline simple value.
    When the request body is assigned `<input>`
    And a PUT is sent to `/anything`
    Then the value of the response body child `data` is equal to:
      """
      <expected>
      """

  #Expecting Ruby stringification and using painful escaping
  Examples:
    | input             | expected                                            |
    | //                | ""(?-mix:)""                                        |
    | /\//              | ""(?-mix:\\\\\\/)""                                 |
    | /.*/              | ""(?-mix:.*)""                                      |
    | /"[[:alpha:]]?"/  | ""(?-mix:\\"[[:alpha:]]?\\")""                      |
    | /foo bar/         | ""(?-mix:foo bar)""                                 |
