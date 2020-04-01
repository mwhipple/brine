Feature: Adding Basic Auth

  Scenario: A new header with expected value is added to request.
    When the request credentials are set for basic auth user `user` and password `pass`
    And a GET is sent to `/anything`

    Then the value of the response body child `headers` is including:
      """
      {"Authorization":"Basic dXNlcjpwYXNz"}
      """

