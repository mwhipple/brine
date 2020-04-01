Feature: Matching
  It can be asserted that a value matches another string or regex.

  Scenario: String in response body is matched against a regex.
    When the request body is assigned:
      """
      http://www.github.com?var=val
      """
    And a PUT is sent to `/anything`
    Then the value of the response body child `data` is matching `/github/`
    And the value of the response body child `data` is matching `/git.*\?.*=/`
    And the value of the response body child `data` is not matching `/gh/`
    And the value of the response body child `data` is not matching `/^github/`

  @pending @assertion_against_assignment
  Scenario: Regex in response body matched against a string
    When the request body is assigned:
      """
      /(.+)\1/
      """
    And a PUT is sent to `/anything`
    Then the value of the response body child `data` is matching `blahblah`
    And the value of the response body child `data` is matching `boo`
    And the value of the response body child `data` is not matching `blah blah`
    And the value of the response body child `data` is not matching `blah`
