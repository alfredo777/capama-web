class PostsController < ApplicationController
skip_before_filter :verify_authenticity_token, :only => [:create, :update]
layout 'admin'
  def posts
  @posts = BlogPost.all
  end

  def show
    @post = BlogPost.find_by_id(params[:id])
  end

  def user_posts
  @posts = current_user.blog_posts
  end

  def create
    @post = BlogPost.create(title: params[:title], content: params[:content], type: params[:type], user_id: current_user.id, active: params[:active], head_image: params[:head_image])
    if @post.save
      @notice = "Se ha creado el post correctamente"
      else
      @notice = "El post no ha posido ser creado"
    end
    respond_to do |format|
      format.js
    end
  end

  def destroy
  end

  def edit
  end
end