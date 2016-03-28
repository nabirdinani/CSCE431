Feature: Login
    In order to view information
    A visitor
    Should login via login form
 
    Scenario: Accepts user login information
        Given I am on the login page
        And I fill in "session email" with "jasonkrez@tamu.edu"
        And I fill in "session password" with "password123"
        When I press "button"
        Then page should have notice message "Welcome, Jason!"
