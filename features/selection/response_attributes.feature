Feature: Response Attribute
  A response attribute can be selected for assertion.

  Scenario: Response body.
    When a GET is sent to `/base64/SFRUUEJJTiBpcyBhd2Vzb21l`
    Then the value of the response body is equal to `HTTPBIN is awesome`

  Scenario: Response status.
    When a GET is sent to `/status/409`
    Then the value of the response status is equal to `409`

  Scenario: Response headers.
    When the request query parameter `foo` is assigned `bar`
    And a GET is sent to `/response-headers`
    Then the value of the response headers is including:
      """
      {"foo":"bar"}
      """

  Scenario: Response header child.
    When the request query parameter `foo` is assigned `bar`
    And a GET is sent to `/response-headers`
    Then the value of the response headers is including:
      """
      {"foo":"bar"}
      """
    Then the value of the response headers child `foo` is equal to `bar`
