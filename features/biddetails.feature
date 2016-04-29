Feature: See details and bid on artwork
    In order to buy an item
    A visitor
    Should be able to bid on an item
 
    Scenario: Verify button is present
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
        And I go to the user info page for "jason"
        When I click "More Details"
        Then I should see "Current Bid"
        
        
        Scenario: Verify bid input works
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
        And I go to the user info page for "jason"
        When I click "More Details"
        And I fill in "bid_amount" with "50.00"
        When I press "Create Bid"
        Then I should see "Your bid was submitted successfully!!"
        