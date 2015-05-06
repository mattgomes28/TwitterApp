Feature: login

  Scenario: Correct password and username entered
    Given I am on the homepage
    When I fill in "username" with "matheus"
    When I fill in "password" with "password"
    When I press "Submit" within "form"
    Then I should see "Welcome Back!"

  Scenario: Wrong password  and correct username entered
    Given I am on the homepage
    When I fill in "username" with "matheus"
    When I fill in "password" with "nonsense"
    When I press "Submit" within "form"
    Then I should see "Login"
    Then I should see "Access Denied"

  Scenario: Wrong password  and  username entered
    Given I am on the homepage
    When I fill in "username" with "user"
    When I fill in "password" with "nonsense"
    When I press "Submit" within "form"
    Then I should see "Login"
    Then I should see "Error: Not a valid username"

  Scenario: Correct password  and wrong username entered
    Given I am on the homepage
    When I fill in "username" with "user"
    When I fill in "password" with "password"
    When I press "Submit" within "form"
    Then I should see "Login"
    Then I should see "Error: Not a valid username"

