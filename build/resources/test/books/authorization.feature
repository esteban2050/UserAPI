@ignore
Feature: This will be a file to do the authorization

  @create
  Scenario: post a user to generate a token
    * def identifierName = function() {return Math.floor((1000) * Math.random());}
    * def name = 'esteban' +  identifierName()
    * def email = name + "@example.com"

    Given url "https://simple-books-api.glitch.me/"
    And path "api-clients/"
    And request { "clientName": '#(name)', "clientEmail": '#(email)' }
    When method post
    Then status 201
    And def accessToken = $.accessToken
