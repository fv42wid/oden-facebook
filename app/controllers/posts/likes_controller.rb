class Posts::LikesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_post

  def create
    @post.likes.where(user_id: current_user.id).first_or_create
    
    respond_to do |format|
      format.html {redirect_to posts_path}
    end
  end

  private
  
    def set_post
      @post = Post.find(params[:post_id])
    end
end
