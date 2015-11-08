class PostsController < ApplicationController
skip_before_filter :verify_authenticity_token, :only => [:create, :update]
before_filter :session_filter

layout 'admin'
  def posts
  @posts = BlogPost.paginate(:page => params[:page], :per_page => 6).order('id DESC')
  end

  def show
    @post = BlogPost.find_by_id(params[:id])
  end

  def user_posts
  @posts = current_user.blog_posts.paginate(:page => params[:page], :per_page => 6).order('id DESC')
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
    @post = BlogPost.find(params[:id])

    if !params[:title].nil?
      @post.title = params[:title]
    end
    if !params[:content].nil?
      @post.content = params[:content]
    end
    @post.head_image = params[:head_image]

    @post.save

    @notice = "Actualizado correctamente el post"
    respond_to do |format|
      format.js
    end
  end

private 

  def session_filter
   if session[:user] == nil
      redirect_to login_user_path
   end
  end
end