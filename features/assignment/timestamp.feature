Feature: A Timestamp
  An identifier can be assigned a current timestamp.

  Scenario: Newer than some old date.
    Given `v1` is assigned a timestamp
    When the request body is assigned `{{ v1 }}`
    And a PUT is sent to `/anything`
    Then the value of the response body child `data` is greater than `2018-06-17T12:00:00Z`

  Scenario: Values increase.
    Given `v1` is assigned a timestamp

    When `v2` is assigned a timestamp
    And the request body is assigned `{{ v2 }}`
    And a PUT is sent to `/anything`
    Then the value of the response body child `data` is greater than or equal to `{{ v1 }}`

    When `v3` is assigned a timestamp
    And the request body is assigned `{{ v3 }}`
    Then the value of the response body child `data` is greater than or equal to `{{ v1 }}`
    And the value of the response body child `data` is greater than or equal to `{{ v2 }}`
