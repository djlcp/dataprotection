class GroupsController < ApplicationController
  
  before_action :set_group, only: [:show]
  load_and_authorize_resource

  # GET /groups
  # GET /groups.json
  def index
    @groups = Group.all
  end

  # GET /groups/1
  # GET /groups/1.json
  def show
  end

  private
    def set_group
      @group = Group.find(params[:id])
    end
  

end
