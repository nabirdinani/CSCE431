Feature: Signup
    In order to view information
    A visitor
    Should signup via signin page
 
    Scenario: Rejects user signup for incorrect fields
        Given I am on the signup page
        And I fill in "name" with "John Doe"
        And I fill in "phone" with "1231231234"
        And I fill in "email" with "jdoe@doe.com"
        And I fill in "password" with ".........."
        And I fill in "confirm" with "........"
        When I press "signup_button"
        Then I should not see "Welcome, John Doe!"