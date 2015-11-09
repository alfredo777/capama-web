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
    @post = BlogPost.find(params[:id])
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
    @user = User.first
    @ticket = UserHelp.create(email: params[:email], cause: params[:cause], phone: params[:phone] ,explanation: params[:explanation], area: params[:area], user_id: @user.id, latitude: params[:latitude], longitude: params[:longitude] )
    @image = PublicImage.new
    @image.imageable = @ticket
    @image.img = params[:file]
    @image.save

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

  def lang
     session[:lang] = params[:lang]
     redirect_to :back
  end

  def response_forms
    session[:form_sender] = nil
    session[:question_id] = nil
    session[:form_sender] = SecureRandom.hex(10)

    params[:question_responses].each do |qrs| 
     qrs[1].each do |qx|
      if qx[1].is_a? Hash
      question_value = qx[1][:question_value]
      question_id = qx[1][:question]
      puts "#{qx[1][:question_value]} , #{qx[1][:question]}"
      @response = QuestionResponse.create(question_value: question_value, question_id: question_id , form_sender: session[:form_sender] )
      end
     end
    end
    redirect_to printing_view_format_path(form_sender: session[:form_sender])
  end

  def parameters_response_forms
  end
end
