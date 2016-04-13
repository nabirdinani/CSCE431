Feature: Signup
    In order to view information
    A visitor
    Should signup via signin page
 
    Scenario: Accepts user signup information (standard, correct signup)
        Given I am on the signup page
        And I fill in "name" with "John Doe"
        And I fill in "phone" with "1231231234"
        And I fill in "email" with "jdoe@doe.com"
        And I fill in "password" with "test1234"
        And I fill in "confirm" with "test1234"
        When I press "signup_button"
        Then I should not be on the signup page

    Scenario: Correctly welcomes user on signup (standard, correct signup)
        Given I am on the signup page
        And I fill in "name" with "John Doe"
        And I fill in "phone" with "1231231234"
        And I fill in "email" with "johndoe@doe.com"
        And I fill in "password" with "password"
        And I fill in "confirm" with "password"
        When I press "signup_button"
        Then I should see "Please check your email to activate your account."

    Scenario: Rejects user signup for missing name
        Given I am on the signup page
        And I fill in "name" with ""
        And I fill in "phone" with "1231231234"
        And I fill in "email" with "jdoe@doe.com"
        And I fill in "password" with ".........."
        And I fill in "confirm" with ".........."
        When I press "signup_button"
        Then I should be on the users page
        Then I should see "The form contains 1 error"
        Then I should see "Name can't be blank"

    Scenario: Rejects user signup for missing number
        Given I am on the signup page
        And I fill in "name" with "John"
        And I fill in "phone" with ""
        And I fill in "email" with "jdoe@doe.com"
        And I fill in "password" with ".........."
        And I fill in "confirm" with ".........."
        When I press "signup_button"
        Then I should be on the users page
        Then I should see "The form contains 1 error"
        Then I should see "Phone can't be blank"

    Scenario: Rejects user signup for missing email
        Given I am on the signup page
        And I fill in "name" with "John"
        And I fill in "phone" with "1231231234"
        And I fill in "email" with ""
        And I fill in "password" with ".........."
        And I fill in "confirm" with ".........."
        When I press "signup_button"
        Then I should be on the users page
        Then I should see "The form contains 2 error"
        Then I should see "Email can't be blank"
        Then I should see "Email is invalid"

    Scenario: Rejects user signup for missing password
        Given I am on the signup page
        And I fill in "name" with ""
        And I fill in "phone" with "1231231234"
        And I fill in "email" with "jdoe@doe.com"
        And I fill in "password" with ""
        And I fill in "confirm" with ".........."
        When I press "signup_button"
        Then I should be on the users page
        Then I should see "The form contains 4 errors"

    Scenario: Rejects user signup for missing everything
        Given I am on the signup page
        When I press "signup_button"
        Then I should be on the users page
        Then I should see "The form contains 7 errors"

    Scenario: Rejects user signup for different passwords
        Given I am on the signup page
        And I fill in "name" with "John"
        And I fill in "phone" with "1231231234"
        And I fill in "email" with "jdoe@doe.com"
        And I fill in "password" with "PASSWORD"
        And I fill in "confirm" with "password"
        When I press "signup_button"
        Then I should be on the users page
        Then I should see "The form contains 1 error"
        Then I should see "Password confirmation doesn't match Password"
        
    Scenario: Correctly indicates to check email
        Given I am on the signup page
        And I fill in "name" with "John"
        And I fill in "phone" with "1231231234"
        And I fill in "email" with "example@example.com"
        And I fill in "password" with "password"
        And I fill in "confirm" with "password"
        When I press "signup_button"
        Then I should see "Please check your email to activate your account."
        And I should receive an email
        
        
    Scenario: Correctly sends email to correct address
        Given I am on the signup page
        And I fill in "name" with "John"
        And I fill in "phone" with "1231231234"
        And I fill in "email" with "example@example.com"
        And I fill in "password" with "password"
        And I fill in "confirm" with "password"
        When I press "signup_button"
        And I should receive an email
        When I open the email
        Then I should see "Account activation - Health4All" in the email subject
        When I click the first link in the email
        
        
    Scenario: Correctly activates
        Given I am on the signup page
        And I fill in "name" with "John"
        And I fill in "phone" with "1231231234"
        And I fill in "email" with "example@example.com"
        And I fill in "password" with "password"
        And I fill in "confirm" with "password"
        When I press "signup_button"
        And I should receive an email
        When I open the email
        Then I should see "Account activation - Health4All" in the email subject
        When I click the first link in the email
        And I am on the login page
        Given I am on the login page
        And I fill in "session email" with "example@example.com"
        And I fill in "session password" with "password"
        When I press "login_button"
        Then I should see "Welcome, John!"