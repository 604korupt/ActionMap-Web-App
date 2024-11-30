# frozen_string_literal: true

class CampaignsController < ApplicationController
  def index
    @cycles = Campaign.cycle
    @categories = Campaign.categories.keys
  end

  def search
    @candidates = Campaign.find_candidates(params[:campaigns])
  end
end
