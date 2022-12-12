Feature: get user on regres

  Background:
    * url "https://reqres.in/"

  Scenario: get a user
    Given path "api/users/2"
    When method get
    Then status 200

  Scenario: get the data of the student and validate the format of the name
    Given path "api/users?page=1"
    When method get
    Then status 200
    And print response
    And match response.data[0].name == "#string"

  Scenario: get the list of the student and validate the format of the list
    Given path "api/users?page=1"
    When method get
    Then status 200
    And print response
    And match response.data == "#array"

  Scenario: get a list of user and validate a json area
    Given path "api/users?page=1"
    When method get
    Then status 200
    And print response
    And match response contains deep {"page": 1}

  Scenario: get a list of users and validate the name of the first user in the array
    Given path "api/users?page=1"
    When method get
    Then status 200
    And print response
    And match response.data[0].name == "cerulean"

  Scenario: get a list of users and validate the size of the array
    Given path "api/users?page=1"
    When method get
    Then status 200
    And print response
    And match response.data == "#[6]"

  Scenario: get a list of users and validate using fuzzy matcher(is present one element)
    Given path "api/users?page=1"
    When method get
    Then status 200
    And print response
    And match response.data[1].name == "#present"

  Scenario: get a list of user and validate a json area
    * def actualResponse = read("/responsePage1.json")
    Given path "api/users?page=1"
    When method get
    Then status 200
    And print response
    And match response == actualResponse

  Scenario: Executing a java script function
    * def fakeValue = function () {Math.floor((1000) * Math.random());}
    Given path "api/users?page=1"
    When method get
    Then status 200
    And print response
    And match response.data[0].id != fakeValue