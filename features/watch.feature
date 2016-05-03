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
        When I am on the user info page for "jason"

    Scenario: If they click watch button , will be subscribed and unsubscribed
        Given the following users
          | name  | phone      | email              | password |
          | jason | 7134098786 | jasonkrez@tamu.edu | password |
        Given the user "jason" is activated
        Given I am on the login page
        And I fill in "session email" with "jasonkrez@tamu.edu"
        And I fill in "session password" with "password"
        When I press "login_button"
        Given I am on the artworks page
        And I fill in "name" with "test123"
        And I fill in "descrip" with "my picture"
        When I upload a file
        Given the artwork has been approved
        When I am on the user info page for "jason"
        When I click "watch_button"
        Then I should see "You will now receive notifications for this item."
        When I am on the user info page for "jason"
        When I click "watch_button"
        Then I should see "You will no longer receive notifications for this item."
        When I am on the user info page for "jason"
        When I click "watch_button"
        Then I should see "You will now receive notifications for this item."





