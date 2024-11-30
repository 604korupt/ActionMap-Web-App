# frozen_string_literal: true

Given(/some default states exist/) do
  State.create!(
    name:         'California',
    symbol:       'CA',
    fips_code:    '06',
    is_territory: 0,
    lat_min:      '-124.409591',
    lat_max:      '-114.131211',
    long_min:     '32.534156',
    long_max:     '-114.131211'
  )
end

Then(/I click "([^"]*)" on the state map/) do |string|
  visit "state/#{string}"
end

Then(/^I click on county (.+)$/) do |county|
  visit search_representatives_path(county)
end
