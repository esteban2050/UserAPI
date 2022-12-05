Feature: post user on regres

  Background:
    * url "https://reqres.in/"
    * path "api/users/"

  Scenario: post a user
    * def var = { "name": "Esteban", "job": "Automator" }
    Given request var
    When method post
    Then status 201

  Scenario Outline: post with multiple users
    * def var = { "name": "#(name)", "job": "#(job)" }
    Given request var
    When method post
    Then status 201
    Examples:
    |name|job|
    | Lola   | Leader  |
    | Hugo   | Lawyer  |
    | Tabo   | Teacher  |

  Scenario: post a user without job
    Given request { "name": "Esteban"}
    When method post
    Then status 201

  Scenario: post a user with characters
    Given request { "name": "%';Esteban$", "job": "Automator" }
    When method post
    Then status 201