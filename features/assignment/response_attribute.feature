Feature: Response Attribute
  An identifier can be assigned a value extracted from a response attribute.

  Scenario: Response body.
    Given the request body is assigned `foo`
    And a PUT is sent to `/anything`
    When `myVar` is assigned the response body child `data`
    And the request body is assigned `{{ myVar }}`
    And a PUT is sent to `/anything`
    Then the value of the response body child `data` is equal to `foo`

  Scenario: Response body child.
    Given the request body is assigned `{"response": "foo"}`
    And a PUT is sent to `/anything`
    When `myVar` is assigned the response body child `json.response`
    And the request body is assigned `{{ myVar }}`
    And a PUT is sent to `/anything`
    Then the value of the response body child `data` is equal to `foo`

  Scenario: Response body children.
    Given the request body is assigned `{"response": "foo"}`
    And a PUT is sent to `/anything`
    When `myVar` is assigned the response body children `json.response`
    And the request body is assigned `{{{ myVar }}}`
    And a PUT is sent to `/anything`
    Then the value of the response body child `json` is equal to `["foo"]`

  Scenario: Response header.
    Given the request query parameter `test` is assigned `val`
    And a GET is sent to `/response-headers`
    When `myVar` is assigned the response headers child `test`
    And the request body is assigned `{{ myVar }}`
    And a PUT is sent to `/anything`
    Then the value of the response body child `data` is equal to `val`
