Feature: delete user on regres

  Scenario: delete a user
    * call read("../post/user-post-snippet.feature@Create")
    Given url "https://reqres.in/api/users/" + contactId
    When method delete
    Then status 204
