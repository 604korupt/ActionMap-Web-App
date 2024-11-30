# frozen_string_literal: true

require 'rails_helper'
require 'spec_helper'

require 'google/apis/civicinfo_v2'

describe Representative do
  context 'when searching multiple times' do
    let(:stub_offices) do
      instance_double(Google::Apis::CivicinfoV2::Office, official_indices: [0])
    end
    let(:stub_official) do
      instance_double(Google::Apis::CivicinfoV2::Official, name: 'Joseph R. Biden', address: nil,
      party: 'Republican Party', photo_url: '')
    end

    let(:sample_info) do
      instance_double(Google::Apis::CivicinfoV2::RepresentativeInfoResponse,
                      officials: [stub_official], offices: [stub_offices])
    end

    it 'returns a list of representatives' do
      allow(stub_offices).to receive_messages(name: 'Joseph R. Biden')
      allow(stub_offices).to receive_messages(division_id: 'ocd-division/country:us')
      result = described_class.civic_api_to_representative_params(sample_info)
      expect(result.size).to be >= 1
    end

    it 'does not have duplicates' do
      allow(stub_offices).to receive_messages(name: 'Joseph R. Biden')
      allow(stub_offices).to receive_messages(division_id: 'ocd-division/country:us')
      result = described_class.civic_api_to_representative_params(sample_info)
      described_class.civic_api_to_representative_params(sample_info)
      expect(described_class.count).to eq(result.size)
    end
  end
end
