Feature: User can click on a state and click on a county to see a list of representatives
  As a user of the app
  I want to click on a state to see the counties of this state
  I want to click on a county to see the list of representatives

Scenario: Click on a state
  Given some default states exist
  And I am on the home page
  When I click "CA" on the state map
  Then I should see "California"

Scenario: Click on a county
  Given I am on the home page
  Then I click "CA" on the state map
  Then I click on county "Lake County"
  Then I should see "President of the United States"