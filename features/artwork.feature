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
        Then I should see "Submit your own Artwork" 

    Scenario: Upload image
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
        Then I should see "The picture test123 has been submitted."

    Scenario: Upload image alternate
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
        When I upload a file alternate
        Then I should see "The picture test123 has been submitted."

    Scenario: Upload wrong image file
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
        When I upload wrong image file
        Then I should see "Picture was not uploaded."
        
    Scenario: reject image if no name
      Given the following users
          | name  | phone      | email              | password |
          | jason | 7134098786 | jasonkrez@tamu.edu | password |
        Given the user "jason" is activated
        Given I am on the login page
        And I fill in "session email" with "jasonkrez@tamu.edu"
        And I fill in "session password" with "password"
        When I press "login_button"
        Given I am on the artworks page
        And I fill in "name" with ""
        And I fill in "descrip" with "my picture"
        When I upload a file
        Then I should see "Picture was not uploaded."


    Scenario: accept image if no description
      Given the following users
          | name  | phone      | email              | password |
          | jason | 7134098786 | jasonkrez@tamu.edu | password |
        Given the user "jason" is activated
        Given I am on the login page
        And I fill in "session email" with "jasonkrez@tamu.edu"
        And I fill in "session password" with "password"
        When I press "login_button"
        Given I am on the artworks page
        And I fill in "name" with "Picture"
        When I upload a file
        Then I should see "The picture Picture has been submitted."

    Scenario: accept image if no file (this needs a workaround)
      Given the following users
          | name  | phone      | email              | password |
          | jason | 7134098786 | jasonkrez@tamu.edu | password |
        Given the user "jason" is activated
        Given I am on the login page
        And I fill in "session email" with "jasonkrez@tamu.edu"
        And I fill in "session password" with "password"
        When I press "login_button"
        Given I am on the artworks page
        And I fill in "name" with "Picture"
        When I press "submit_file"
        Then I should not see "Picture was not uploaded."
        Then I should not see "Attachment can't be blank"

    Scenario: reject if user just clicks submit
      Given the following users
          | name  | phone      | email              | password |
          | jason | 7134098786 | jasonkrez@tamu.edu | password |
        Given the user "jason" is activated
        Given I am on the login page
        And I fill in "session email" with "jasonkrez@tamu.edu"
        And I fill in "session password" with "password"
        When I press "login_button"
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
        Then I should see "Submit your own Artwork" 
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
        Given the user "nabir" is activated
        Given I am on the login page
        And I fill in "session email" with "nabir@tamu.edu"
        And I fill in "session password" with "passworD"
        When I press "login_button"
        Then I should not be on the login page
        Given I am on the artworks page
        And I fill in "name" with "test"
        And I fill in "descrip" with "my picture"
        When I upload a file
        Given I am on the artworks page
        And I fill in "name" with "test1"
        And I fill in "descrip" with "my picture"
        When I upload a file alternate
        Given I am on the login page
        And I fill in "session email" with "nabir@tamu.edu"
        And I fill in "session password" with "passworD"
        When I press "login_button"
        Then I should see "test"
        Then I should see "test1"
        Then I should see "Download Artwork"

    Scenario: Check if art deletes correctly
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
        Given I am on the artworks page
        And I fill in "name" with "test1"
        And I fill in "descrip" with "my picture"
        When I upload a file
        When I press "delete_test1"
        Then I should see "The picture test1 has been deleted."

    Scenario: Upload, check display, delete, check delete
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
        Given I am on the artworks page
        And I fill in "name" with "test"
        And I fill in "descrip" with "my picture"
        When I upload a file
        Given I am on the artworks page
        And I fill in "name" with "test1"
        And I fill in "descrip" with "my picture"
        When I upload a file alternate
        Given I am on the login page
        And I fill in "session email" with "nabir@tamu.edu"
        And I fill in "session password" with "passworD"
        When I press "login_button"
        When I press "delete_test1"
        Then I should see "The picture test1 has been deleted."
        Given I am on the login page
        And I fill in "session email" with "nabir@tamu.edu"
        And I fill in "session password" with "passworD"
        When I press "login_button"
        Then I should not see "test1"
        Then I should see "test"

