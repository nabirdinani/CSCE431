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
        Then I should see "View Auction Items"
    
    Scenario: Verify home link to page works
        Given the following users
          | name  | phone      | email              | password |activated|
          | Nick | 9703062020 | tafoya77n@yahoo.com | password | true|
        Given the user "Nick" is activated
        Given I am on the login page
        And I fill in "session email" with "tafoya77n@yahoo.com"
        And I fill in "session password" with "password"
        And I press "login_button"
        And I go to the user info page for "Nick"
        When I click "Home"
        Then I should be on the home page
        
    Scenario: Verify no permission
        Given I am on the bidview_index page
        Then I should see "You must login to view this page."
        
        
    Scenario: Verify link to page works
        Given the following users
          | name  | phone      | email              | password |activated|
          | Nick | 9703062020 | tafoya77n@yahoo.com | password | true|
        Given the user "Nick" is activated
        Given I am on the login page
        And I fill in "session email" with "tafoya77n@yahoo.com"
        And I fill in "session password" with "password"
        And I press "login_button"
        And I go to the user info page for "Nick"
        When I click "view_auction_but"
        Then I should see "Hello, Nick."
        
    Scenario: Verify link to upload page works
        Given the following users
          | name  | phone      | email              | password | activated |
          | Nick | 9703062020 | tafoya77n@yahoo.com | password | true |
        Given the user "Nick" is activated
        Given I am on the login page
        And I fill in "session email" with "tafoya77n@yahoo.com"
        And I fill in "session password" with "password"
        And I press "login_button"
        And I go to the bidview_index page
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
        Given I am on the bidview_index page
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
        Given I am on the bidview_index page
        Then I should see "More Details"
        