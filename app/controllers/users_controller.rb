class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :is_good_user?, only: [:show]

  def show
    @user = User.find_by(id: current_user.id)
    @event = Event.where(organizer: current_user)
  end

  private

  def is_good_user?
    unless current_user == User.find(params[:id])
      flash[:notice] = "Tu es sur la page d'un autre utilisateur"
      redirect_to root_path
    end
  end
end
