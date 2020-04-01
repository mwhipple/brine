Feature: A Parameter
  An identifier can be assigned the value of the provided parameter.

  Scenario: Simple assignment.
    Given `foo` is assigned `bar`
    When the request body is assigned `{{ foo }}`
    And a PUT is sent to `/anything`
    Then the value of the response body child `data` is equal to `bar`
