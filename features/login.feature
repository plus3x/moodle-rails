Feature: Log in
  Is a steps of authorization

  Background:
    Given a user:
      | login    | mxphill          |
      | password | secret           |
      | email    | mxphill@mail.com |
      | role     | student          |

  Scenario Outline: Log in
    When I visit Login page
    And I fill login with "<login>"
    And I fill password with "<password>"
    And I press Login
    Then I redirected to "<path>"
    And I see <notification>: "<message>"

    Examples: With good credentials
      | login   | password | path       | notification | message          |
      | mxphill | secret   | /dashboard | success      | Successful login |

    Examples: With bad credentials
      | login   | password | path   | notification | message                           |
      |         | secret   | /login | danger       | Invalid user/password combination |
      | mxphill |          | /login | danger       | Invalid user/password combination |
      |         |          | /login | danger       | Invalid user/password combination |
      | Vasya   | fake     | /login | danger       | Invalid user/password combination |
      | Masya   | secret   | /login | danger       | Invalid user/password combination |
