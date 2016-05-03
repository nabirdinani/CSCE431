    Feature: Set prices on items
    In order to price items
    An Admin
    Should be able view and approve artwork
    
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
        
    Scenario: Not admin can't see link
      Given the following users
            | name  | phone      | email              | password | admin|
            | Nick | 9703062020 | tafoya77n@yahoo.com | password | 1|
        Given the user "Nick" is activated
        Given I am on the login page
        And I fill in "session email" with "tafoya77n@yahoo.com"
        And I fill in "session password" with "password"
        And I press "login_button"
        Then I should not see "Review Submitted Artwork"
    
   Scenario: Not signed in can't see page
     Given I am on the review_index page
     Then I should see "You must be logged in to view this page."
     
    Scenario: Not admin can't see page
      Given the following users
            | name  | phone      | email              | password | admin|
            | Nick | 9703062020 | tafoya77n@yahoo.com | password | 1|
        Given the user "Nick" is activated
        Given I am on the login page
        And I fill in "session email" with "tafoya77n@yahoo.com"
        And I fill in "session password" with "password"
        And I press "login_button"
        Given I am on the review_index page
        Then I should see "You are not authorized to view this page."
    
    Scenario: Admin sees link works for admin
        Given the following users
            | name  | phone      | email              | password | admin|
            | Nick | 9703062020 | tafoya77n@yahoo.com | password | 1|
        Given the user "Nick" is activated
        Given the user "Nick" is an admin
        Given I am on the login page
        And I fill in "session email" with "tafoya77n@yahoo.com"
        And I fill in "session password" with "password"
        And I press "login_button"
        And I go to the user info page for "Nick"
        And I click "Review Submitted Artwork"
        Then I should see "Review Submission Panel"
    
    
    Scenario: No artwork no inputs
        Given the following users
            | name  | phone      | email              | password | admin|
            | Nick | 9703062020 | tafoya77n@yahoo.com | password | 1|
        Given the user "Nick" is activated
        Given the user "Nick" is an admin
        Given I am on the login page
        And I fill in "session email" with "tafoya77n@yahoo.com"
        And I fill in "session password" with "password"
        And I press "login_button"
        Given I am on the review_index page
        Then I should not see "Starting Price"
        
        Scenario: With artwork buttons show up
        Given the following users
            | name  | phone      | email              | password | activated|
            | Nick | 9703062020 | tafoya77n@yahoo.com | password | true|
        Given the user "Nick" is activated
        Given the user "Nick" is an admin
        Given I am on the login page
        And I fill in "session email" with "tafoya77n@yahoo.com"
        And I fill in "session password" with "password"
        And I press "login_button"
        Given I am on the artworks page
        And I fill in "name" with "test123"
        And I fill in "descrip" with "my picture"
        When I upload a file
        Given I am on the review_index page
        Then I should see "Starting Price"
        
    Scenario: Input start price
        Given the following users
            | name  | phone      | email              | password |
            | Nick | 9703062020 | tafoya77n@yahoo.com | password |
        Given the user "Nick" is activated
        Given the user "Nick" is an admin
        Given I am on the login page
        And I fill in "session email" with "tafoya77n@yahoo.com"
        And I fill in "session password" with "password"
        And I press "login_button"
        Given I am on the artworks page
        And I fill in "name" with "test123"
        And I fill in "descrip" with "my picture"
        When I upload a file
        Given I am on the review_index page
        And I fill in "startingprice" with "7.00"
        And I fill in "autowinprice" with "9.00"
        And I press "Accept"
        Then I should see "Artwork approved!"
        
    Scenario: startingnprice has to be number
        Given the following users
            | name  | phone      | email              | password |
            | Nick | 9703062020 | tafoya77n@yahoo.com | password |
        Given the user "Nick" is activated
        Given the user "Nick" is an admin
        Given I am on the login page
        And I fill in "session email" with "tafoya77n@yahoo.com"
        And I fill in "session password" with "password"
        And I press "login_button"
        Given I am on the artworks page
        And I fill in "name" with "test123"
        And I fill in "descrip" with "my picture"
        When I upload a file
        And I go to the review_index page
        And I fill in "startingprice" with "abcdefghijkl;;lkdjf;lkasjdf;lkaj"
        And I press "Accept"
        Then I should see "Prices must be number amounts"
        
        
    Scenario: test rejected
        Given the following users
            | name  | phone      | email              | password |
            | Nick | 9703062020 | tafoya77n@yahoo.com | password |
        Given the user "Nick" is activated
        Given the user "Nick" is an admin
        Given I am on the login page
        And I fill in "session email" with "tafoya77n@yahoo.com"
        And I fill in "session password" with "password"
        And I press "login_button"
        Given I am on the artworks page
        And I fill in "name" with "test123"
        And I fill in "descrip" with "my picture"
        When I upload a file
        And I go to the review_index page
        And I press "Reject"
        Then I should see "The artwork test123 was rejected."