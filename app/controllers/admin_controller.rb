class AdminController < ApplicationController
  before_filter :session_filter, :only => [:index]
  
  layout 'admin'

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
    @post = BlogPost.find(params[:id])
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
    @customers_all = Customer.all
    respond_to do |format|
      format.html 
      format.xls {
        filename = "Customers-#{Time.now.strftime("%Y%m%d%H%M%S")}.xls"
        send_data(@customers_all.to_xls, :type => "text/xls; charset=utf-8; header=present", :filename => filename)
       }
    end
  end

  def destroy_customer
    @customer = Customer.find(params[:id])
    @customer.destroy

    flash[:notice] = "Ha sido destruido el cliente"
    redirect_to :back
  end

  def config_roles
    render layout: "login"

  end

  def congif_users
    @roles = Role.all
    render layout: "login"
  end

  ###### readings water #####

  def readings
    @readings = ReadingAssignment.paginate(:page => params[:page], :per_page => 40).order('id DESC')
    users = User.where(:area => 'reportes')
    @users = users.order(name: :asc)
  end

  def show_readings
    @route = ReadingAssignment.find_by_id(params[:id])
    @routes = @route.reading_takes_waters.paginate(:page => params[:page], :per_page => 1000).order('id DESC')
    respond_to do |format|
      format.html 
    end
  end

  def contracts
    @contracts = ServiceContract.paginate(:page => params[:page], :per_page => 40).order('id DESC')
  end

  def inspects
    @inspects = UserInspect.paginate(:page => params[:page], :per_page => 100).order('id DESC')
    users = User.where(:area => 'inspector')
    @users = users.order(name: :asc)
  end

  def show_inspects
    @route = UserInspect.find_by_id(params[:id])
    @routes =  @route.inspects.paginate(:page => params[:page], :per_page => 40).order('id DESC')
  end

  def open_inspect
    @inspect = Inspect.find(params[:id])
    
  end

  

  def export_inspect
    @inspect = Inspect.where(id: params[:id])
    respond_to do |format|
      format.html 
      format.xls {
        filename = "Inspect-#{Time.now.strftime("%Y%m%d%H%M%S")}.xls"
        send_data(@inspect.to_xls, :type => "text/xls; charset=utf-8; header=present", :filename => filename)
       }
    end
  end

  def celphone_images
    @images = ImagesStringCelphone.where(imageable_id: params[:imageable_id], imageable_type: params[:imageable_type])
  end

  def export_contract
    @contract = ServiceContract.where(id: params[:id])
    respond_to do |format|
      format.html 
      format.xls {
        filename = "Contrato-#{Time.now.strftime("%Y%m%d%H%M%S")}.xls"
        send_data(@contract.to_xls, :type => "text/xls; charset=utf-8; header=present", :filename => filename)
       }
    end
  end

private 

  def session_filter
   if session[:user] == nil
      redirect_to login_user_path
   end
  end

  
end
