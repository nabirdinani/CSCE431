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

    Scenario: Rejects incorrect credentials
        Given the following users
          | name  | phone      | email              | password |
          | jason | 7134098786 | jasonkrez@tamu.edu | password |
          | nabir | 9799999999 | nabir@tamu.edu     | passworD |
        Given I am on the login page
        And I fill in "session email" with "nabir@tamu.edu"
        And I fill in "session password" with "password"
        When I press "login_button"
        Then I should be on the login page

    Scenario: Correctly navigates to correct user on login
        Given the following users
          | name  | phone      | email              | password |
          | jason | 7134098786 | jasonkrez@tamu.edu | password |
          | nabir | 7134098788 | nabir@tamu.edu     | password |
        Given I am on the login page
        And I fill in "session email" with "nabir@tamu.edu"
        And I fill in "session password" with "password"
        When I press "login_button"
        Then I should not see "Welcome, jason!" 

    Scenario: Sign up and then verify login
        Given the following users
          | name  | phone      | email              | password |
          | jason | 7134098786 | jasonkrez@tamu.edu | password |
          | nabir | 7134098788 | nabir@tamu.edu     | password |
        Given I am on the signup page
        And I fill in "name" with "John Doe"
        And I fill in "phone" with "1231231234"
        And I fill in "email" with "jdoe@doe.com"
        And I fill in "password" with "test1234"
        And I fill in "confirm" with "test1234"
        When I press "signup_button"
        Then I should see "Welcome, John Doe!"
        Given I am on the login page
        And I fill in "session email" with "jdoe@doe.com"
        And I fill in "session password" with "test1234"
        When I press "login_button"
        Then I should not be on the login page
        Then I should see "Welcome, John Doe!"