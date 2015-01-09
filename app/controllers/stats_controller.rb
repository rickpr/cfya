class StatsController < ApplicationController
  def index
    @members = Member.all
  end
end
