class MembershipsController < ApplicationController
	
	respond_to :html

  def create
  	#ActiveRecord::Base.connection.clear_cache!
  	@micropost = Micropost.find(params[:membership][:member_of_id])
  	current_user.attend!(@micropost)
  	respond_with @micropost
  end

  def destroy
  end
end
