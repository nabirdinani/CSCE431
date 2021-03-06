Feature: Login
    In order to view information
    A visitor
    Should login via login form
 
    Scenario: Accepts user login information (existing user, login yes)
    	Given the following users
          | name  | phone      | email              | password |
          | jason | 7134098786 | jasonkrez@tamu.edu | password |
        Given the user "jason" is activated
        Given I am on the login page
        And I fill in "session email" with "jasonkrez@tamu.edu"
        And I fill in "session password" with "password"
        When I press "login_button"
        Then I should see "Hello, jason!" 

    Scenario: Correctly redirects user to user page (existing user, login yes, verify correct user login)
        Given the following users
          | name  | phone      | email              | password |
          | jason | 7134098786 | jasonkrez@tamu.edu | password |
          | nabir | 9799999999 | nabir@tamu.edu     | passworD |
        Given the user "nabir" is activated
        Given I am on the login page
        And I fill in "session email" with "nabir@tamu.edu"
        And I fill in "session password" with "passworD"
        When I press "login_button"
        Then I should not be on the login page
        Then I should see "Hello, nabir!"

    Scenario: Rejects incorrect credentials (existing user, login no)
        Given the following users
          | name  | phone      | email              | password |
          | jason | 7134098786 | jasonkrez@tamu.edu | password |
          | nabir | 9799999999 | nabir@tamu.edu     | passworD |
        Given the user "nabir" is activated
        Given I am on the login page
        And I fill in "session email" with "nabir@tamu.edu"
        And I fill in "session password" with "password"
        When I press "login_button"
        Then I should be on the login page
        Then I should see "Invalid email/password combination"

    Scenario: Correctly navigates to correct user on login (existing user, login yes)
        Given the following users
          | name  | phone      | email              | password |
          | jason | 7134098786 | jasonkrez@tamu.edu | password |
          | nabir | 7134098788 | nabir@tamu.edu     | password |
        Given the user "nabir" is activated
        Given I am on the login page
        And I fill in "session email" with "nabir@tamu.edu"
        And I fill in "session password" with "password"
        When I press "login_button"
        Then I should not see "Hello, jason!" 

    Scenario: Correctly navigates to correct user on login (existing user, login yes)
        Given the following users
          | name  | phone      | email              | password |
          | jason | 7134098786 | jasonkrez@tamu.edu | password |
          | nabir | 7134098788 | nabir@tamu.edu     | password |
        Given the user "nabir" is activated
        Given I am on the login page
        And I fill in "session email" with "nabir@tamu.edu"
        And I fill in "session password" with "password"
        When I press "login_button"
        Then I should not see "Hello, jason!" 

    Scenario: Rejects wrong username
        Given the following users
          | name  | phone      | email              | password |
          | jason | 7134098786 | jasonkrez@tamu.edu | password |
          | nabir | 7134098788 | nabir@tamu.edu     | password |
        Given the user "nabir" is activated
        Given I am on the login page
        And I fill in "session email" with "nabirr@tamu.edu"
        And I fill in "session password" with "password"
        When I press "login_button"
        Then I should be on the login page
        Then I should see "Invalid email/password combination"

    Scenario: Rejects wrong username and password
        Given the following users
          | name  | phone      | email              | password |
          | jason | 7134098786 | jasonkrez@tamu.edu | password |
          | nabir | 7134098788 | nabir@tamu.edu     | password |
        Given the user "nabir" is activated
        Given I am on the login page
        And I fill in "session email" with "nabirr@tamu.edu"
        And I fill in "session password" with "passwords"
        When I press "login_button"
        Then I should be on the login page
        Then I should see "Invalid email/password combination"

    Scenario: Rejects empty username
        Given the following users
          | name  | phone      | email              | password |
          | jason | 7134098786 | jasonkrez@tamu.edu | password |
          | nabir | 7134098788 | nabir@tamu.edu     | password |
        Given the user "nabir" is activated
        Given the user "jason" is activated
        Given I am on the login page
        And I fill in "session email" with ""
        And I fill in "session password" with "passwords"
        When I press "login_button"
        Then I should be on the login page
        Then I should see "Invalid email/password combination"

    Scenario: Rejects empty password
        Given the following users
          | name  | phone      | email              | password |
          | jason | 7134098786 | jasonkrez@tamu.edu | password |
          | nabir | 7134098788 | nabir@tamu.edu     | password |
        Given the user "nabir" is activated
        Given the user "jason" is activated
        Given I am on the login page
        And I fill in "session email" with "nabir@tamu.edu"
        And I fill in "session password" with ""
        When I press "login_button"
        Then I should be on the login page
        Then I should see "Invalid email/password combination"

    Scenario: Sign up and then verify login
        Given the following users
          | name  | phone      | email              | password |
          | jason | 7134098786 | jasonkrez@tamu.edu | password |
          | nabir | 7134098788 | nabir@tamu.edu     | password |
        Given the user "nabir" is activated
        Given the user "jason" is activated
        Given I am on the signup page
        And I fill in "name" with "John Doe"
        And I fill in "phone" with "1231231234"
        And I fill in "email" with "example@example.com"
        And I fill in "password" with "test1234"
        And I fill in "confirm" with "test1234"
        When I press "signup_button"
        And I should receive an email
        When I open the email
        Then I should see "Account activation - Health4All" in the email subject
        When I click the first link in the email
        Given I am on the login page
        And I fill in "session email" with "example@example.com"
        And I fill in "session password" with "test1234"
        When I press "login_button"
        Then I should see "Hello, John Doe!"
        
        
    Scenario: Lets user know that they need to activate account
      Given the following users
          | name  | phone      | email              | password |
          | jason | 7134098786 | jasonkrez@tamu.edu | password |
          | nabir | 7134098788 | nabir@tamu.edu     | password |
        Given I am on the login page
        And I fill in "session email" with "nabir@tamu.edu"
        And I fill in "session password" with "password"
        When I press "login_button"
        Then I should see "Account not activated. Check your email for the activation link."