Feature: Adding Headers

  Scenario: A new header with a single value is added to request.
    When the request header `foo` is assigned `bar`
    And a GET is sent to `/anything`

    Then the value of the response body child `headers` is including:
      """
      {"Foo": "bar"}
      """

  Scenario: Default headers are present in requests.
    When a GET is sent to `/anything`

    Then the value of the response body child `headers` is including:
      """
      {"Content-Type": "application/json"}
      """

  Scenario: Default headers can be overridden.
    When the request header `Content-Type` is assigned `text/plain`
    And a GET is sent to `/anything`

    Then the value of the response body child `headers` is including:
      """
      {"Content-Type": "text/plain"}
      """

  Scenario: Array header values are added to requests.
    When the request header `X-Array` is assigned `[1, 2, 3]`
    And a GET is sent to `/anything`

    Then the value of the response body child `headers` is including:
      """
      {"X-Array": "1, 2, 3"}
      """

  Scenario: The last set value for a given header wins.
    When the request header `foo` is assigned `bar`
    And the request header `foo` is assigned `baz`
    And a GET is sent to `/anything`

    Then the value of the response body child `headers` is including:
      """
      {"Foo": "baz"}
      """

  Scenario Outline: Header is added regardless of HTTP method.
    When the request header `Foo` is assigned `bar`
    And a <method> is sent to `/anything`

    Then the value of the response body child `headers` is including:
      """
      {"Foo": "bar"}
      """
  Examples:
    | method  |
    | POST    |
    | PUT     |
    | DELETE  |
