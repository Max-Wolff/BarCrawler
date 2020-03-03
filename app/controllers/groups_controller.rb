require_relative '../services/google_maps_directions_api'

class GroupsController < ApplicationController

  def show
    @group = Group.first
  end

  def new
    @group = Group.new
  end

  def create
    @group = Group.create(token: params[:authenticity_token], name: params[:group][:name])
    @group.save
  end
end
