Feature: Assigning a Request Body

  Scenario: Attach a basic body.
    When the request body is assigned:
      """
      {"request": 1}
      """
    And a PUT is sent to `/anything`

    Then the value of the response body child `json` is equal to:
      """
      {"request": 1}
      """

  Scenario: Attach a template body.
    Given `val` is assigned `foo`
    When the request body is assigned:
      """
      {"request":"{{val}}"}
      """
    And a PUT is sent to `/anything`

    Then the value of the response body child `json` is equal to:
      """
      {"request": "foo"}
      """
