@ignore
Feature: Reusable scenarios for post a user

  @Create
  Scenario: post a user without job
    Given url "https://reqres.in/api/users/"
    And  request { "name": "Esteban", "job":"Leader"}
    When method post
    Then status 201
    And def contactId = $.id
