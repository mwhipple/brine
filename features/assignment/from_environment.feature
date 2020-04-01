Feature: Assign conventional environment variables.

  Scenario: Conventional environment variable is present in binding.
    When the request body is assigned `{{from_env}}`
    And a PUT is sent to `/anything`
    Then the value of the response body child `data` is equal to `Read from environment`
