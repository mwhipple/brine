Feature: Adding Extra Headers

  Scenario: A header is added to the request on basic construction.
    When the client sets the header `Foo` to `Bar`
    And a GET is sent to `/anything`

    Then the value of the response body child `headers` is including:
      """
      {"Foo": "Bar"}
      """

  Scenario Outline: A header is added to subsequent requests.
    Given the client sets the header `Foo` to `Bar`
    And a GET is sent to `/anything`

    When a <method> is sent to `/anything`
    Then the value of the response body child `headers` is including:
      """
      {"Foo": "Bar"}
      """
  Examples:
    | method |
    | GET    |
    | POST   |
    | PUT    |
    | DELETE |

  Scenario: Each header assignment is idempotent.
    Given the client sets the header `Foo` to `Bar`
    And the client sets the header `Foo` to `Bar`
    And a GET is sent to `/anything`

    Given the client sets the header `Foo` to `Bar`
    When a GET is sent to `/anything`
    Then the value of the response body children `headers.Foo` is equal to:
      """
      ["Bar"]
      """

  Scenario: Multiple header assignments can be combined.
    Given the client sets the header `Foo` to `Bar`
    And the client sets the header `Blah` to `Baz`
    And a GET is sent to `/anything`

    When a GET is sent to `/anything`
    Then the value of the response body child `headers` is including:
      """
      {"Foo": "Bar",
       "Blah": "Baz"}
      """
