Feature: Cleared After Sent
  After a request is sent, any values that were added to that request
  are cleared and will not be present in subsequent requests.

  Scenario: Request body is cleared.
    When the request body is assigned:
      """
      {"request":1}
      """
    And a PUT is sent to `/anything`
    And a PUT is sent to `/anything`

    Then the value of the response body child `json` is empty

  Scenario: Request parameter
    When the request query parameter `foot` is assigned `bar`
    And a GET is sent to `/anything`
    And a GET is sent to `/anything`

    Then the value of the response body child `args` is empty
