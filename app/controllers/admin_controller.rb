class AdminController < ApplicationController
  before_filter :config, only: [:index, :all_post, :posts, :files, :tickets, :admin_tiket_show, :create_zone]
  before_filter :session_filter, only: [:index,]
  
  def login
  end

  def index
    helps = []
    @helps = UserHelp.last(50)
    @pending = UserHelp.where(open: false).count
    @process = UserHelp.where(open: true, solve: false).count
    @solve = UserHelp.where(solve: true).count
    @views_today = Views.where("created_at >= ?", Time.zone.now.beginning_of_day).count
    @views_monthly = Views.where("created_at >= ?", Time.zone.now.beginning_of_month).count
    @views_year = Views.where("created_at >= ?", Time.zone.now.beginning_of_year).count
    @views_today_list = Views.where("created_at >= ?", Time.zone.now.beginning_of_day).last(30)
    @views_monthly_celphone = Views.where("agent LIKE? or agent LIKE? or agent LIKE?", "%iPhone%","%Android%", "%iPad%").count
    @zones = Zone.all
    @helps.each do |h|
       helps.push(
        "lat": "#{h.latitude}",
        "lon": "#{h.longitude}",
        "title": "#{h.cause}",
        "zoom": 13,
        "html": "<h3>#{h.cause}</h3>"
       )
    end

    @helps = helps.to_json
  end
  
  ##### se crean los post #####

  def all_post
  end

  def post
  end

  def new_post
  end

  def edit_post
  end
  
  def update_post
  end

  def delete_post
  end

  ##### manejo de archivos #######

  def files
    @pictures = Picture.paginate(:page => params[:page], :per_page => 10).order('id DESC')
  end

  def destroy_file_image
    @picture = Picture.find(params[:id])
    @picture.destroy
    respond_to do |format|
      format.js
    end
  end

  def create_new_image
    @picture = Picture.new
    @picture.name = params[:name]
    @picture.user_id = current_user.id
    @picture.version_img = params[:file]
    @picture.save

    @local_path = params[:local_path]
   
    respond_to do |format|
      format.js
    end
  end

  def load_image_select

    case params[:type]
      when "list"
        @route = "list_images"
        @pictures = Picture.all
      when "load"
       @route = "new_image"
       @pictures = nil
    end

    @local_path = params[:local_path]
      
    respond_to do |format|
      format.js
    end
  end

  #### tikets ######

  def tickets
    @tickets = current_user.user_helps.where(solve: false).paginate(:page => params[:page], :per_page => 15).order('id DESC')
    @tickets_finish = current_user.user_helps.where(solve: true).paginate(:page => params[:page], :per_page => 15).order('id DESC')
  end

  def admin_tiket_show
    require 'thread/pool'
    require 'thread/future'
    require 'thread/delay'

    @ticket = UserHelp.find(params[:id])
    @ticket.open = true
    @ticket.save
    helpa = []
    helpa.push({
        "lat": "#{@ticket.latitude}",
        "lon": "#{@ticket.longitude}",
        "title": "#{@ticket.cause}",
        "zoom": 18,
        "html": "<h3>#{@ticket.cause}</h3>",
    })

    @position = helpa.to_json
    @conversation = @ticket.conversations.last
   

    if @ticket.conversations.count != 0
      puts @conversation.id
      if !@conversation.close_conversation
        timexec = Thread.new {timerexecute( @conversation ) }
      end
    end


  end
  def timerexecute(conversation)
    sleep(180)
    puts "Se cierra la sesión del chat para evitar malos manejos"
    @conversation = conversation
    puts @conversation
    @conversation.close_conversation = true
    @conversation.save
    ActiveRecord::Base.clear_active_connections!
  end

  def close_ticket
    @ticket = UserHelp.find(params[:id])
    @ticket.solve = true
    @ticket.save
    flash[:notice] = "Se ha finalizado la petición de ayuda"
    redirect_to  tickets_path
  end

  def create_zone
    @zone = Zone.new
    @zone.title = params[:title]
    @zone.lat = params[:lat]
    @zone.long = params[:long]
    @zone.save

    if @zone.save
       flash[:notice] = "Zona creada correctamente"
      else
        flash[:notice] = "La zona no ha sido creada"
    end

    redirect_to :back
  end

  def new_zone
    @zones = Zone.paginate(:page => params[:page], :per_page => 20).order('id DESC')
  end

  def destroy_zone
    @zone = Zone.find(params[:id])
    @zone.destroy
    flash[:notice] = "Zona eliminada correctamente"
    redirect_to :back
  end

  def customers
    @customers = Customer.paginate(:page => params[:page], :per_page => 30).order('id DESC')
  end

  def destroy_customer
    @customer = Customer.find(params[:id])
    @customer.destroy

    flash[:notice] = "Ha sido destruido el cliente"
    redirect_to :back
  end

  def config_roles
  end

  def congif_users
  end

private 

  def session_filter
   if session[:user] == nil
      redirect_to login_user_path
   end
  end

  def config
     r = Role.count
     s = User.count
    if r.count == 0
      congif_roles_path
    end

    if s.count == 0
      congif_users_path
    end
    render layout: 'application'
  end
end
