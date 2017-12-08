class MilestonesController < ApplicationController
  http_basic_authenticate_with name: "matthias", password: "alwayskeeponlearning"

  def index
    @milestones = Milestone.order :created_at
  end

  def new
    @milestone = Milestone.new
  end

  def create
    @milestone = Milestone.create milestone_params

    redirect_to action: :index
  end

  def destroy
    @milestone = Milestone.find params[:id]
    @milestone.destroy

    redirect_to action: :index
  end

  def edit
    @milestone = Milestone.find params[:id]
  end

  def update
    @milestone = Milestone.find params[:id]
    @milestone.assign_attributes milestone_params

    flash[:success] = "You rock, keep on working! :) 🎉" if !@milestone.done_was && @milestone.done
    @milestone.save!
    redirect_to action: :index
  end

  private
  def milestone_params
    params.require(:milestone).permit :title, :done
  end
end
