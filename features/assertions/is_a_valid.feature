Feature: A Valid
  It can be asserted that a value is a valid instance of a type.

  Scenario: String in response body is only a valid String.
    When the request body is assigned:
      """
      foo
      """
    And a PUT is sent to `/anything`
    Then the value of the response body child `data` is a valid `String`
    And the value of the response body child `data` is not a valid `Number`
    And the value of the response body child `data` is not a valid `Integer`
    And the value of the response body child `data` is not a valid `Object`
    And the value of the response body child `data` is not a valid `Array`
    And the value of the response body child `data` is not a valid `Boolean`

  Scenario: Integer in response body is a valid Integer and Number.
    When the request body is assigned:
      """
      1
      """
    And a PUT is sent to `/anything`
    Then the value of the response body child `json` is not a valid `String`
    And the value of the response body child `json` is a valid `Number`
    And the value of the response body child `json` is a valid `Integer`
    And the value of the response body child `json` is not a valid `Object`
    And the value of the response body child `json` is not a valid `Array`
    And the value of the response body child `json` is not a valid `Boolean`

  Scenario: Quoted Number in response body is only a valid String.
    When the request body is assigned:
      """
      "1"
      """
    And a PUT is sent to `/anything`
    Then the value of the response body child `data` is a valid `String`
    And the value of the response body child `data` is not a valid `Number`
    And the value of the response body child `data` is not a valid `Integer`
    And the value of the response body child `data` is not a valid `Object`
    And the value of the response body child `data` is not a valid `Array`
    And the value of the response body child `data` is not a valid `Boolean`

  Scenario: Empty Object in response body is only a valid Object.
    When the request body is assigned:
      """
      {}
      """
    And a PUT is sent to `/anything`
    Then the value of the response body child `json` is not a valid `String`
    And the value of the response body child `json` is not a valid `Number`
    And the value of the response body child `json` is not a valid `Integer`
    And the value of the response body child `json` is a valid `Object`
    And the value of the response body child `json` is not a valid `Array`
    And the value of the response body child `json` is not a valid `Boolean`

  Scenario: Object in response body is only a valid Object.
    When the request body is assigned:
      """
      {"foo": 1}
      """
    And a PUT is sent to `/anything`
    Then the value of the response body child `json` is not a valid `String`
    And the value of the response body child `json` is not a valid `Number`
    And the value of the response body child `json` is not a valid `Integer`
    And the value of the response body child `json` is a valid `Object`
    And the value of the response body child `json` is not a valid `Array`
    And the value of the response body child `json` is not a valid `Boolean`

  Scenario: Quoted Object in response body is only a valid String.
    When the request body is assigned:
      """
      "{"foo": 1}"
      """
    And a PUT is sent to `/anything`
    Then the value of the response body child `data` is a valid `String`
    And the value of the response body child `data` is not a valid `Number`
    And the value of the response body child `data` is not a valid `Integer`
    And the value of the response body child `data` is not a valid `Object`
    And the value of the response body child `data` is not a valid `Array`
    And the value of the response body child `data` is not a valid `Boolean`

  Scenario: Empty Array in response body is only a valid Array.
    When the request body is assigned:
      """
      []
      """
    And a PUT is sent to `/anything`
    Then the value of the response body child `json` is not a valid `String`
    And the value of the response body child `json` is not a valid `Number`
    And the value of the response body child `json` is not a valid `Integer`
    And the value of the response body child `json` is not a valid `Object`
    And the value of the response body child `json` is a valid `Array`
    And the value of the response body child `json` is not a valid `Boolean`

  Scenario: Array in response body is only a valid Array.
    When the request body is assigned:
      """
      [1, "foo"]
      """
    And a PUT is sent to `/anything`
    Then the value of the response body child `json` is not a valid `String`
    And the value of the response body child `json` is not a valid `Number`
    And the value of the response body child `json` is not a valid `Integer`
    And the value of the response body child `json` is not a valid `Object`
    And the value of the response body child `json` is a valid `Array`
    And the value of the response body child `json` is not a valid `Boolean`

  Scenario: true in response body is only a valid Boolean.
    When the request body is assigned:
      """
      true
      """
    And a PUT is sent to `/anything`
    Then the value of the response body child `json` is not a valid `String`
    And the value of the response body child `json` is not a valid `Number`
    And the value of the response body child `json` is not a valid `Integer`
    And the value of the response body child `json` is not a valid `Object`
    And the value of the response body child `json` is not a valid `Array`
    And the value of the response body child `json` is a valid `Boolean`

  Scenario: false in response body is only a valid Boolean.
    When the request body is assigned:
      """
      {"foo": false}
      """
    And a PUT is sent to `/anything`
    Then the value of the response body child `json.foo` is not a valid `String`
    And the value of the response body child `json.foo` is not a valid `Number`
    And the value of the response body child `json.foo` is not a valid `Integer`
    And the value of the response body child `json.foo` is not a valid `Object`
    And the value of the response body child `json.foo` is not a valid `Array`
    And the value of the response body child `json.foo` is a valid `Boolean`

  Scenario: null in response body is not any valid type.
    When the request body is assigned:
      """
      [null]
      """
    And a PUT is sent to `/anything`
    Then the value of the response body child `json[0]` is not a valid `String`
    And the value of the response body child `json[0]` is not a valid `Number`
    And the value of the response body child `json[0]` is not a valid `Integer`
    And the value of the response body child `json[0]` is not a valid `Object`
    And the value of the response body child `json[0]` is not a valid `Array`
    And the value of the response body child `json[0]` is not a valid `Boolean`

  Scenario: Selected Array child is a valid Array.
    When the request body is assigned:
      """
      {"val": [1, 2, 3]}
      """
    And a PUT is sent to `/anything`
    Then the value of the response body child `json.val` is a valid `Array`

  Scenario: Selected Array child member is a valid String.
    When the request body is assigned:
      """
      {"val": [1, 2, 3]}
      """
    And a PUT is sent to `/anything`
    Then the value of the response body child `json.val[0]` is a valid `Number`
    Then the value of the response body child `json.val[0]` is a valid `Integer`

  Scenario: Selected nested children are a valid Array.
    When the request body is assigned:
      """
      [{"val": 1},{"val": 2}]
      """
    And a PUT is sent to `/anything`
    Then the value of the response body children `json.val` is a valid `Array`

  Scenario: Selected nested children can be tested for type.
    When the request body is assigned:
      """
      [{"val": 1},{"val": 2}]
      """
    And a PUT is sent to `/anything`
    Then the value of the response body children `json.val` has elements which are all a valid `Number`
    And the value of the response body children `json.val` has elements which are all a valid `Integer`

  Scenario: Selected nested children can be tested for type when Arrays.
    When the request body is assigned:
      """
      [{"val": [1]},{"val": [2]}]
      """
    And a PUT is sent to `/anything`
    Then the value of the response body children `json.val` has elements which are all a valid `Array`
