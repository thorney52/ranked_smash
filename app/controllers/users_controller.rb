class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user

  def show
  	@matches = @user.latest_complete_matches.includes(:winner, :player_one, :player_two, :player_one_character, :player_two_character, :stage)
  	@paginated_matches = @maatches.page(params[:page])
  end

  private

  def set_user
  	@user = User.find(params[:id])
  end
end
