Feature: File Upload Assignment

  Background:
    Given a user:
      | login    | mxphill |
      | role     | student |
    And a user:
      | login    | mxteach |
      | role     | teacher |
    And a course:
      | title    | New course |
      | students | mxphill    |
      | teachers | mxteach    |
    And a learning unit:
      | title  | Week1      |
      | course | New course |
    And a activity:
      | title         | File Upload Assignment |
      | description   | 2 + 2 = ?              |
      | learning_unit | Week1                  |
      | max_grade     | 4                      |

  Scenario: Upload file
    Given I'm logged in as a Student
    And I'm on activity "File Upload Assignment"
    When I upload file "calculation.txt"
    Then I see uploaded file "calculation.txt"
