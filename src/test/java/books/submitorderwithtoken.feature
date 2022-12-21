Feature: create an order

  @createOrderWithToken
  Scenario Outline: post to create an order with an accessToken
    * call read("authorization.feature@create")
    Given url "https://simple-books-api.glitch.me/"
    And path "orders"
    And header Authorization = accessToken
    And request {"bookId": <bookId>, "customerName": '<customerName>' }
    When method post
    Then status 201
    And match response.created == true
    And print response


    Examples:
      | bookId | customerName |
      | 1      | Esteban12345 |