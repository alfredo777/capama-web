class ApiController < ApplicationController
  skip_before_filter :verify_authenticity_token  
  
  def posts
    @posts = BlogPost.paginate(:page => params[:page], :per_page => 6).order('id DESC')
    if params[:pagination] != nil
      render json: {posts: @posts, total_pages: @posts.total_pages}
    else
      render json: {title: 'Noticias', posts: @posts}
    end
  end

  def users
    @users = User.paginate(:page => params[:page], :per_page => 30).order('id DESC')
    render json: @users
  end

  def view_post
    @post = BlogPost.find_by_id(params[:id])
    render json: @post
  end

  def search_post
    input = params[:search]
    input = input.gsub(/[^0-9A-Za-z]/, '')

    @posts = BlogPost.find(:all , conditions: ["title LIKE ?", "#{input}%"])
    if @posts.count == 0
      render json: {posts: "No hay posts"}
    else
      render json: {posts: @posts}
    end
    
  end

  def viewver
    path = "#{request.referrer}"
    if !path.nil?
    @view = Views.create(viewver_id: params[:id], viewver_type: params[:type], path: path, agent:  request.env['HTTP_USER_AGENT'])
    puts @view
    render json: @view
    else
    render json: "Error"
    end
  end

  def create_ticket
    @user = User.where(area: 'suport').first
    @ticket = UserHelp.create(email: params[:email], cause: params[:cause], phone: params[:phone] ,explanation: params[:explanation], area: params[:area], user_id: @user.id, latitude: params[:latitude], longitude: params[:longitude] )
    @customer = Customer.find_by_email("#{params[:email]}")
    if !@customer.nil?
      redirect_to chat_path(customer: @customer.id, ticket: @ticket.id)
    else
      redirect_to new_customer_path(email: params[:email], phone: params[:phone], chat: true)
    end
  end

  def create_customer
    @customer = Customer.create(email: params[:email], phone: params[:phone], name: params[:name], address: params[:address])

    if params[:chat]
      redirect_to chat_path(customer: @customer.id)
    else
      redirect_to root_path
    end
  end
end
