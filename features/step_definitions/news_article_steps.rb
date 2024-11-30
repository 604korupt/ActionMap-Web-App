# frozen_string_literal: true

When(/^(?:|I )am logged in$/) do
  step %(I am on the login page)
  step %(I press "Sign in with Google")
end

Given(/I press the "(.*)" button for first representative/) do |button_name|
  first(:link, button_name).click
end

And(/fill in the information for news article/) do
  fill_in('news_item[title]', with: 'Test News')
  fill_in('news_item[link]', with: 'https://testnews.com')
  fill_in('news_item[description]', with: 'This is test description')
  select 'Joseph R. Biden', from: 'news_item[representative_id]'
  select 'Free Speech', from: 'news_item[issue]'
end

And(/I fill in the updated information for news article/) do
  fill_in('news_item[description]', with: 'Updated description')
  select 'Joseph R. Biden', from: 'news_item[representative_id]'
end
