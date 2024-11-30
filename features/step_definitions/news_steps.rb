# frozen_string_literal: true

Given /the following articles exist/ do |new_items_table|
  new_items_table.hashes.each do |news|
    # each returned element will be a hash whose key is the table header.
    # you should arrange to add that movie to the database here.
    NewsItem.create!(news)
  end
  # pending "Fill in this step in movie_steps.rb"
end

Then /(.) seed news_items should exist/ do |n_seeds|
  expect(NewsItem.count).to eq n_seeds.to_i
end

When /^(?:|I )look up news of "([^"]*)"$/ do |rep_name|
  rep_row = find('tr', text: rep_name)
  within rep_row do
    click_link('News Article')
  end
end
