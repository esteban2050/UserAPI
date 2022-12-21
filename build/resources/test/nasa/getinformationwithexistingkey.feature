Feature: This is a feature to test the different APIs with token

  Background:
    * url "https://api.nasa.gov/"

  Scenario: Get the basic information
    * def key = '2XeKwiCMSH1gjkaar5WkbNsWUwlWjxJHdKcCogd6'
    Given path "neo/rest/v1/feed"
    And params {start_date: '2015-09-07', end_date: '2015-09-08' , api_key: '#(key)'}
    When method get
    Then status 200
    And print response
    And match response.element_count == "#number"
    And match response.element_count == 25