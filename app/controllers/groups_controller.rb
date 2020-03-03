require_relative '../services/google_maps_directions_api'

class GroupsController < ApplicationController

  def show
    @group = Group.first
  end
end
