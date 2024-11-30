# frozen_string_literal: true

require 'faraday'
require 'json'

class Campaign < ApplicationRecord
  def self.find_candidates(url_params, api_key='9lcjslvwVjbqtX0KcQQ3W9rFm316caQQ2T89n4xA')
    category = Campaign.categories
    url = "https://api.propublica.org/campaign-finance/v1/#{url_params[:cycle]}/candidates/leaders/#{category[url_params[:categories]]}"
    string_json = Faraday.get(url, nil, { 'X-API-Key': api_key })
    response = JSON.parse(string_json.body)
    new_array = []
    0.upto(response['results'].length - 1) do |i|
      name = response['results'][i]['name']
      new_array.append(name)
    end
    new_array
  end

  def self.cycle
    [2010, 2012, 2014, 2016, 2018, 2020]
  end

  def self.categories
    { 'Candidate Loan' => 'candidate-loan.json', 'Contribution Total' => 'contribution-total.json',
      'Debts Owed' => 'debts-owed.json', 'Disbursements Total' => 'disbursements-total.json',
      'End Cash' => 'end-cash.json', 'Individual Total' => 'individual-total.json',
      'PAC Total' => 'pac-total.json', 'Receipts Total' => 'receipts-total.json',
      'Refund Total' => 'refund-total.json' }
  end
end
