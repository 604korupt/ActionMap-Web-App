Feature: User checks events
  As a user of the app
  I want to check events
  So that I know when they start and end

Background: Background: Seed in event data

Given the following states exist:
  | name          | symbol | fips_code    | is_territory   | lat_min       | lat_max      | long_min    | long_max    | 
  | California    | CA     | 06           | 0              | -124.409591   | -114.131211  | 32.534156   | -114.131211 |

Scenario: Go to events page
  Given I am on the home page
  When I go to the events page
  Then I should see "Events"

Scenario: Add a new event
  Given I am on the home page
  When I go to the login page
  Then I should see "Sign In"
  Then I press "Sign in with Google"
  When I go to the events page
  And I follow "Add New Event"
  Then I should see "New event"
  When I fill in "event_name" with "Test Event"
  And I fill in "Description:" with "Test Description"
  Then I select "California" from "event[state]" 
  And I press "Save"
