Feature: Signup email
    In order to view information
    A visitor
    Should signup via signin page
 
    Scenario: Correctly welcomes user on signup
        Given I am on the signup page
        And I fill in "name" with "John Doe"
        And I fill in "phone" with "1231231234"
        And I fill in "email" with "jasdf@e.com"
        And I fill in "password" with "password"
        And I fill in "confirm" with "password"
        When I press "signup_button"
        Then I should not see "Welcome, Johnny Doe!"