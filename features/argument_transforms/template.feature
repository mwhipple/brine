Feature: Template
  An argument that includes _{{ }}_ interpolation markers will be
  treated as a template and transformed into an evaluated version of
  that template using the current binding environment which will then
  also be transformed.

  Scenario Outline: Docstring single value template.
    When `bound` is assigned `<binding>`
    And the request body is assigned:
      """
      {{{ bound }}}
      """
    And a PUT is sent to `/anything`
    Then the value of the response body child `json` is equal to `<expected>`
  Examples:
    | binding        | expected   |
    | true           | true       |
    | -452           | -452       |
    | ["a", 1]       | ["a", 1]   |

  Scenario Outline: Inline single value template.
    When `bound` is assigned `<binding>`
    And the request body is assigned `{{{ bound }}}`
    And a PUT is sent to `/anything`
    Then the value of the response body child `json` is equal to `<expected>`

  Examples:
    | binding        | expected   |
    | true           | true       |
    | -452           | -452       |
    | ["a", 1]       | ["a", 1]   |
