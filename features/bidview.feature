Feature: View all avalible items to bid on
    In order to select an item to bid on
    A user
    Should be see a list of all items
    
    Scenario: Verify button is present
        Given the following users
          | name  | phone      | email              | password |
          | Nick | 9703062020 | tafoya77n@yahoo.com | password |
        Given I am on the login page
        Given the user "Nick" is activated
        And I fill in "session email" with "tafoya77n@yahoo.com"
        And I fill in "session password" with "password"
        When I press "login_button"
        Then I should see "Hello, Nick"
        
    Scenario: Verify no permission
        Given I am on the bidview_index page
        Then I should see "You must login to view this page."
        
        
    Scenario: Verify link to upload page works
        Given the following users
          | name  | phone      | email              | password | activated |
          | Nick | 9703062020 | tafoya77n@yahoo.com | password | true |
        Given the user "Nick" is activated
        Given I am on the login page
        And I fill in "session email" with "tafoya77n@yahoo.com"
        And I fill in "session password" with "password"
        And I press "login_button"
        Given I am on the user info page for "Nick"
        When I click "upload_button1"
        Then I should see "Attachment"
        
        
        
    Scenario: Verify lack of artwork shows up correctly
        Given the following users
        | name  | phone      | email              | password | activated|
        | Nick | 9703062020 | tafoya77n@yahoo.com | password | true|
        Given the user "Nick" is activated
        Given I am on the login page
        And I fill in "session email" with "tafoya77n@yahoo.com"
        And I fill in "session password" with "password"
        And I press "login_button"
        Given I am on the user info page for "Nick"
        Then I should not see "More Details"
        
        
    Scenario: Verify new artwork shows up correctly
        Given the following users
        | name  | phone      | email              | password | activated|
        | Nick | 9703062020 | tafoya77n@yahoo.com | password | true|
        Given the user "Nick" is activated
        Given I am on the login page
        And I fill in "session email" with "tafoya77n@yahoo.com"
        And I fill in "session password" with "password"
        And I press "login_button"
        Given I am on the artworks page
        And I fill in "name" with "test123"
        And I fill in "descrip" with "my picture"
        When I upload a file
        Given I am on the user info page for "Nick"
        Then I should see "More Details"
        
        
    Scenario: Verify donate button works
        Given the following users
            | name  | phone      | email              | password | activated|
            | Nick | 9703062020 | tafoya77n@yahoo.com | password | true|
        Given the user "Nick" is activated
        Given I am on the login page
        And I fill in "session email" with "tafoya77n@yahoo.com"
        And I fill in "session password" with "password"
        And I press "login_button"
        Given I am on the user info page for "Nick"
        Then I see the link "donate_button" to "#"
        
        
    Scenario: Verify details button works
        Given the following users
            | name  | phone      | email              | password | activated|
            | Nick | 9703062020 | tafoya77n@yahoo.com | password | true|
        Given the user "Nick" is activated
        Given I am on the login page
        And I fill in "session email" with "tafoya77n@yahoo.com"
        And I fill in "session password" with "password"
        And I press "login_button"
        Given I am on the artworks page
        And I fill in "name" with "test123"
        And I fill in "descrip" with "my picture"
        When I upload a file
        Given I am on the user info page for "Nick"
        When I click "More Details"
        Then I should be on the biddetails page
        
        Scenario: Verify Favorites button works(To be implemented Iteration 3)
        Given the following users
            | name  | phone      | email              | password | activated|
            | Nick | 9703062020 | tafoya77n@yahoo.com | password | true|
        Given the user "Nick" is activated
        Given I am on the login page
        And I fill in "session email" with "tafoya77n@yahoo.com"
        And I fill in "session password" with "password"
        And I press "login_button"
        Given I am on the artworks page
        And I fill in "name" with "test123"
        And I fill in "descrip" with "my picture"
        When I upload a file
        Given I am on the user info page for "Nick"
        When I click "Add to Favorites"
        Then I should be on the user info page for "Nick"
        
        Scenario: Verify watch button works
        Given the following users
            | name  | phone      | email              | password | activated|
            | Nick | 9703062020 | tafoya77n@yahoo.com | password | true|
        Given the user "Nick" is activated
        Given I am on the login page
        And I fill in "session email" with "tafoya77n@yahoo.com"
        And I fill in "session password" with "password"
        And I press "login_button"
        Given I am on the artworks page
        And I fill in "name" with "test123"
        And I fill in "descrip" with "my picture"
        When I upload a file
        Given I am on the user info page for "Nick"
        When I click "Watch Item"
        Then I should be on the user info page for "Nick"
        
        
        Scenario: Admin sees extra button
        Given the following users
            | name  | phone      | email              | password | admin|
            | Nick | 9703062020 | tafoya77n@yahoo.com | password | 1|
        Given the user "Nick" is activated
        Given the user "Nick" is an admin
        Given I am on the login page
        And I fill in "session email" with "tafoya77n@yahoo.com"
        And I fill in "session password" with "password"
        And I press "login_button"
        Then I should see "Review Submitted Artwork"