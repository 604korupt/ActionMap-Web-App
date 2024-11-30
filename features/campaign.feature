Feature: User can search a finance campaign
  As a user of the app
  I want to click a year and category
  So that I can see the representatives for the finance campaign

Scenario: Seeing Main Page
  Given I am on the home page
  When I go to the campaign_finance page
  Then I should see "Search for Campaign Finance"
  And I should see "Cycle"

Scenario: Searching
  Given I am on the home page
  When I go to the campaign_finance page
  Then I should see "Search for Campaign Finance"