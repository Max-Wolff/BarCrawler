class GroupsController < ApplicationController
  def new
    @group = Group.new
  end

  def create
    @group = Group.create(token: params[:authenticity_token], name: params[:group][:name])
    @group.save
    redirect_to unique_group_path(params[:authenticity_token])
  end
end
