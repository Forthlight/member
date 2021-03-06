require_dependency "member/application_controller"

module Member
  class ProfilesController < ApplicationController
    skip_before_filter :authenticate_user!, only: [:show]
    
    def index
      @user = current_user
      @pub_count = Article::Publication.where(author: current_user.id).count
      @publications = Article::Publication.where(author: current_user.id).page(params[:page]).per(9)
    end

    def show
      if user_signed_in? && current_user.id == params[:id].to_i
        redirect_to member.profiles_path
      else
        @user = Member::User.find(params[:id])
        @pub_count = Article::Publication.where(author: @user.id).count
        @publications = Article::Publication.where(author: @user.id).page(params[:page]).per(9)
      end
    end
  end
end
