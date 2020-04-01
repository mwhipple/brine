Feature: Basic Request Construction
  A simple request with a specified method and path can be sent.

  Scenario Outline: Basic URL
    When a <method> is sent to `/anything`
    Then the value of the response body child `method` is equal to `<method>`

  Examples:
    | method |
    | GET    |
    | POST   |
    | PATCH  |
    | DELETE |
    | PUT    |
