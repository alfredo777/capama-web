class ApiController < ApplicationController
  def posts
    @posts = BlogPost.paginate(:page => params[:page], :per_page => 30).order('id DESC')
    render json: @posts
  end

  def users
    @users = User.paginate(:page => params[:page], :per_page => 30).order('id DESC')
    render json: @users
  end

  def create_ticket
    @user = User.where(area: 'suport').first
    @ticket = UserHelp.create(email: params[:email], cause: params[:cause], phone: params[:phone] ,explanation: params[:explanation], area: params[:area], user_id: @user.id )
    @customer = Customer.find_by_email("#{params[:email]}")
    if !@customer.nil?
      redirect_to chat_path(customer: @customer.id)
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
