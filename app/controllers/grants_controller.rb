class GrantsController < ApplicationController
  def index
    @grants = Grant.order("final_decision asc")
  end
end
