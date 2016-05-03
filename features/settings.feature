Feature: The User settings page 
    In order to view their profile information
    A visitor
    Should be able to visit their settings page and view their details
 
    Scenario: If they visit the page, they will see the correct info
        Given the following users
          | name  | phone      | email              | password |
          | jason | 7134098786 | jasonkrez@tamu.edu | password |
        Given the user "jason" is activated
        Given I am on the login page
        And I fill in "session email" with "jasonkrez@tamu.edu"
        And I fill in "session password" with "password"
        When I press "login_button"
        Given I am on the settings page
        Then I should see "Anonymous Mode*"
        Then I should see "Name"
        Then I should see "jason" 

    Scenario: If they visit the page and not logged in, they get rejected
      Given the following users
          | name  | phone      | email              | password |
          | jason | 7134098786 | jasonkrez@tamu.edu | password |
        Given the user "jason" is activated
        Given I am on the settings page
        Then I should see "You must be logged in to view this page."

    Scenario: the default anon mode is off
        Given the following users
          | name  | phone      | email              | password |
          | jason | 7134098786 | jasonkrez@tamu.edu | password |
        Given the user "jason" is activated
        Given the user "jason" is an admin
        Given I am on the login page
        And I fill in "session email" with "jasonkrez@tamu.edu"
        And I fill in "session password" with "password"
        When I press "login_button"
        Given I am on the settings page
        Then I should see "Anonymous Mode*"
        Then I should see "No"

    Scenario: If they choose anonymous feature, they will have it toggled
        Given the following users
          | name  | phone      | email              | password |
          | jason | 7134098786 | jasonkrez@tamu.edu | password |
        Given the user "jason" is activated
        Given the user "jason" is an admin
        Given I am on the login page
        And I fill in "session email" with "jasonkrez@tamu.edu"
        And I fill in "session password" with "password"
        When I press "login_button"
        Given I am on the settings page
        Then I should see "Anonymous Mode*"
        Then I should see "No"
        When I click "anon_mode"
        Then I should be on the settings page
        Then I should see "Anonymous Mode*"
        Then I should see "Your anonymous mode has been changed!"
