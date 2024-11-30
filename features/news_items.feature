Feature: view news article
  As user
  I want to be able the news articles of a representative

Background: set's up joe biden's news page
  Given I am on the home page
  When I go to the representatives page
  Then I should see "Search for a Representative"
  When I fill in "address" with "Berkeley, CA"
  And I press "Search"

  # at this point the database should be 
  #populated with some representatives, including joe

  Then I should see "Joseph R. Biden" 

  Given the following articles exist:
  | title           | link                        | description        | representative_id       |
  | whitehouse      | https://www.whitehouse.gov/ | whitehouse         | 1                       |

  # Joe Biden's representative id is 1 in testing development
  Then 1 seed news_items should exist
  
Scenario: looking at the page for joe
  When I look up news of "Joseph R. Biden"
  Then I should see "Listing News Articles for Joseph R. Biden"
  Then I should see "whitehouse"
