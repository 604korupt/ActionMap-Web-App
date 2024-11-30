Feature: User can add and check new article
  As a political activist,
  I want to know news about a representative
  So that I check the news article 
        
Scenario: click on the news article button for representative
    Given I am on the home page
    When I go to the representatives page
    Then I should see "Search for a Representative"
    When I fill in "address" with "Berkeley, CA"
    And I press "Search"
    And I press the "News Articles" button for first representative
    Then I should see "Articles"
  
Scenario: after login, should be able to add news article to a representative
    Given I am logged in
    When I go to the representatives page
    Then I should see "Search for a Representative"
    When I fill in "address" with "Berkeley, CA"
    And I press "Search"
    And I press the "News Articles" button for first representative
    And I follow "Add News Article"
    Then I should see "Find News Article"
    And I press "Search"
    Then I should see "Free Speech"
    #Then I follow "View all articles"
    #Then I should see "Test News"
    #And I should see "Delete"
  
Scenario: update a news article
    Given I am logged in
    When I go to the representatives page
    Then I should see "Search for a Representative"
    When I fill in "address" with "Berkeley, CA"
    And I press "Search"
    And I press the "News Articles" button for first representative
    And I follow "Add News Article"
    Then I should see "Find News Article"