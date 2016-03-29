Feature: Login 
    In order to view information
    A visitor
    Should login via login form
 
    Scenario: Correctly redirects user to user page
    	Given the following users
          | name  | phone      | email              | password |
          | jason | 7134098786 | jasonkrez@tamu.edu | password |
          | nabir | 9799999999 | nabir@tamu.edu     | passworD |
        Given I am on the login page
        And I fill in "session email" with "nabir@tamu.edu"
        And I fill in "session password" with "passworD"
        When I press "login_button"
        Then I should not see "Welcome, jason!" 