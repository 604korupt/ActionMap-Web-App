# frozen_string_literal: true

Given(/the following states exist/) do |state|
  state.hashes.each do |s|
    State.create!(s)
  end
end
