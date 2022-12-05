Feature: put user on regres

  Scenario: put a user
    Given url "https://reqres.in/api/users/2"
    And request { "name": "MrBeans", "job": "Ya tu sabe" }
    When method put
    Then status 200
    And match $.name == 'MrBeans'
