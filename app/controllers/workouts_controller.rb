class WorkoutsController < ApplicationController
 before_filter :signed_in_user
  before_filter :correct_user,   only: :destroy

  def create
    @workout = current_user.workouts.build(workout_params)
    if @workout.save
      flash[:success] = "Workout created!"
      redirect_to root_url
    else
      @feed_items = []
      render 'static_pages/home'
    end
  end

  def destroy
    @workout.destroy
    redirect_to root_url
  end

  private

    def workout_params
      params.require(:workout).permit(:name)
    end

    def correct_user
      @workout = current_user.workouts.find_by_id(params[:id])
      redirect_to root_url if @workout.nil?
    end
end
