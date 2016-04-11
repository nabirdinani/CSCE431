Feature: Upload files to server
    In order to submit artwork
    A visitor
    Should be able to upload button
 
    Scenario: Verify button is present
        Given the following users
          | name  | phone      | email              | password |
          | jason | 7134098786 | jasonkrez@tamu.edu | password |
        Given the user "jason" is activated
        Given I am on the login page
        And I fill in "session email" with "jasonkrez@tamu.edu"
        And I fill in "session password" with "password"
        When I press "login_button"
        Then I should see "Submit Artwork for Auction" 

    Scenario: Upload image
        Given I am on the artworks page
        And I fill in "name" with "test123"
        And I fill in "descrip" with "my picture"
        When I upload a file
        Then I should see "The picture test123 has been submitted."

    Scenario: Upload image alternate
        Given I am on the artworks page
        And I fill in "name" with "test123"
        And I fill in "descrip" with "my picture"
        When I upload a file alternate
        Then I should see "The picture test123 has been submitted."

    Scenario: Upload wrong image file
        Given I am on the artworks page
        And I fill in "name" with "test123"
        And I fill in "descrip" with "my picture"
        When I upload wrong image file
        Then I should see "Picture was not uploaded."
        Then I should see "Attachment You are not allowed to upload"
        Then I should see "allowed types: jpg, jpeg, gif, png"

    Scenario: reject image if no name
        Given I am on the artworks page
        And I fill in "name" with ""
        And I fill in "descrip" with "my picture"
        When I upload a file
        Then I should see "Picture was not uploaded."
        Then I should see "Name can't be blank"

    Scenario: accept image if no description
        Given I am on the artworks page
        And I fill in "name" with "Picture"
        When I upload a file
        Then I should see "The picture Picture has been submitted."

    Scenario: accept image if no file (this needs a workaround)
        Given I am on the artworks page
        And I fill in "name" with "Picture"
        When I press "submit_file"
        Then I should not see "Picture was not uploaded."
        Then I should not see "Attachment can't be blank"

    Scenario: reject if user just clicks submit
        Given I am on the artworks page
        When I press "submit_file"
        Then I should see "Picture was not uploaded."

    Scenario: Upload image full flow
        Given the following users
          | name  | phone      | email              | password |
          | jason | 7134098786 | jasonkrez@tamu.edu | password |
          | nabir | 9799999999 | nabir@tamu.edu     | passworD |
        Given the user "nabir" is activated
        Given I am on the login page
        And I fill in "session email" with "nabir@tamu.edu"
        And I fill in "session password" with "passworD"
        When I press "login_button"
        Then I should see "Submit Artwork for Auction"
        Given I am on the artworks page
        And I fill in "name" with "test123"
        And I fill in "descrip" with "my picture"
        When I upload a file
        Then I should see "The picture test123 has been submitted."

    Scenario: Check if art display correctly
        Given the following users
          | name  | phone      | email              | password |
          | jason | 7134098786 | jasonkrez@tamu.edu | password |
          | nabir | 9799999999 | nabir@tamu.edu     | passworD |
        Given the following artworks
          | name  | description     | attachment                        |
          | test  | leet pic        | ../support/upload-file/test.jpg   | 
          | test1 | agario 4 life   | nada                              | 
        Given the user "nabir" is activated
        Given I am on the login page
        And I fill in "session email" with "nabir@tamu.edu"
        And I fill in "session password" with "passworD"
        When I press "login_button"
        Then I should not be on the login page
        Then I should see "Name"
        Then I should see "Download Link"
        Then I should see "Description"
        Then I should see "Submit Artwork for Auction"
        Then I should see "test"
        Then I should see "test1"
        Then I should see "leet pic"
        Then I should see "agario 4 life"
        Then I should see "Download Artwork"

    Scenario: Check if art deletes correctly
        Given the following users
          | name  | phone      | email              | password |
          | jason | 7134098786 | jasonkrez@tamu.edu | password |
          | nabir | 9799999999 | nabir@tamu.edu     | passworD |
        Given the following artworks
          | name  | description     | attachment         |
          | test1  | leet pic       | n/a cauase im cray | 
          | test2 | agario 4 life   | nada               | 
        Given the user "nabir" is activated
        Given I am on the login page
        And I fill in "session email" with "nabir@tamu.edu"
        And I fill in "session password" with "passworD"
        When I press "login_button"
        Then I should not be on the login page
        When I press "delete_test1"
        Then I should see "The picture test1 has been deleted."
        Given I am on the login page
        And I fill in "session email" with "nabir@tamu.edu"
        And I fill in "session password" with "passworD"
        When I press "login_button"
        Then I should not see "test1"
        Then I should see "test2"

    Scenario: Upload, check display, delete, check delete
        Given the following users
          | name  | phone      | email              | password |
          | jason | 7134098786 | jasonkrez@tamu.edu | password |
          | nabir | 9799999999 | nabir@tamu.edu     | passworD |
        Given the following artworks
          | name  | description     | attachment         |
          | test1  | leet pic        | n/a cauase im cray | 
          | test2 | agario 4 life   | nada               | 
        Given the user "nabir" is activated
        Given I am on the artworks page
        And I fill in "name" with "test123"
        And I fill in "descrip" with "my picture"
        When I upload a file alternate
        Then I should see "The picture test123 has been submitted."
        Given I am on the login page
        And I fill in "session email" with "nabir@tamu.edu"
        And I fill in "session password" with "passworD"
        When I press "login_button"
        Then I should not be on the login page
        Then I should see "test1"
        Then I should see "test2"
        Then I should see "test123"
        When I press "delete_test123"
        Then I should see "The picture test123 has been deleted."
        Given I am on the login page
        And I fill in "session email" with "nabir@tamu.edu"
        And I fill in "session password" with "passworD"
        When I press "login_button"
        Then I should not see "test123"
        Then I should see "test1"
        Then I should see "test2"

