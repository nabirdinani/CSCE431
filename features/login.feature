Feature: Login
    In order to view information
    A visitor
    Should login via login form
 
    Scenario: Accepts user login information
    	Given the following users
          | name  | phone      | email              | password |
          | jason | 7134098786 | jasonkrez@tamu.edu | password |
        Given I am on the login page
        And I fill in "session email" with "jasonkrez@tamu.edu"
        And I fill in "session password" with "password"
        When I press "login_button"
        Then I should see "Welcome, jason!" 