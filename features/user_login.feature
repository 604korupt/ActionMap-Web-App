Feature: User logs in with a Google or Github account
  As a user of the app
  I want to login with a Google or Github account
  So that it is more convienent 

Scenario: Login with Google
  Given I am on the home page
  When I go to the login page
  Then I should see "Sign In"
  Then I press "Sign in with Google"
  Then I should see "National Map"

Scenario: Login with GitHub
  Given I am on the home page
  When I go to the login page
  Then I should see "Sign In"
  Then I press "Sign in with GitHub"
  Then I should see "National Map"

Scenario: I can go to user profile with logging into account
  Given I am on the home page
  When I go to the login page
  Then I press "Sign in with Google"
  Then I should go to user profile

Scenario: Logout Account
  Given I am on the home page
  When I go to the logout page
  Then I should see "You have successfully logged out."

Scenario: Logged into Account already
  Given I am on the home page
  When I go to the login page
  Then I press "Sign in with Google"
  When I go to the login page
  Then I should see "You are already logged in. Logout to switch accounts."
