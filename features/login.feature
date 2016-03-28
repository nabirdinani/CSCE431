Feature: Login
    In order to view information
    A visitor
    Should login via login form
 
    Scenario: Accepts user login information
        Given I am on the login page
        And I fill in "session email" with "tomcat@tom.com"
        And I fill in "session password" with "password"
        When I press "login_button"
        Then I should be on the users page 