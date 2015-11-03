class UsersController < ApplicationController

  before_filter :session_filter, :only => [:show, :edit, :new, :update, :users, :destroy]
  before_filter :admin_filter, :only => [:show, :create, :edit]

  layout 'admin'

  def users
    @user = User.paginate(:page => params[:page], :per_page => 30).order('id DESC')
  end

  def show
    @user = User.find(params[:id])
  end

  def create
    if "#{params[:password]}" ==  "#{params[:password_confirmation]}"
    @user = User.create(name: params[:name], email: params[:email], password: params[:password], card: params[:card], phone: params[:phone], role_id: params[:role] )
    else
      flash[:notice] = "La contraseña no es igual"
      redirect_to :back
    end

    if @user.save
      flash[:notice] = "Usuario guardado correctamente"
      else
      flash[:notice] = "Error al crear el usuario"
    end
    redirect_to users_path
  end

  def update
    @user = User.find(params[:id])
    if  "#{params[:actual_password]}" != "#{params[:password]}"
       @password = digest("#{params[:password]}").to_s
       else
       @password = "#{params[:actual_password]}"
    end
    if !params[:file].nil?
      avatar = params[:file]
    end
     @user.name = params[:name]
     @user.email = params[:email]
     @user.password = @password 
     @user.card = params[:card]
     @user.phone = params[:phone] 
     @user.role_id = params[:role]
     @user.avatar = avatar
     @user.save

    
    flash[:notice] = "Usuario actualizado"
    redirect_to users_path
  end

  def destroy
     @user = User.find(params[:id])
     @user.destroy
     flash[:notice] = "Usuario eliminado"
     redirect_to :back
  end

  def edit
    @user = User.find(params[:id])
    @roles = Role.all
  end

  def new
    @user = User.new
    @roles = Role.all
  end

  ##### metodos de session #####

  def login
    render layout: "login"
  end

  def session_create
    @user = User.find_by_card(params[:card])
    if @user != nil
    password_cript(params[:password], @user)
       else
        flash[:notice] = 'Usuario no existente pruebe de nuevo'
        redirect_to :back
    end
  end

  def session_exit
    session[:user] = nil
    redirect_to login_user_path
  end

private
  def session_filter
   if session[:user] == nil
      redirect_to login_user_path
   end
  end

  def admin_filter
  end

protected
  ############## protected methods ###################
  def password_cript(password, user)
      passw = digest(password).to_s
      backend_validate = user.w_digest(passw)
      puts "#{backend_validate}"

      if  backend_validate == true
        session[:user] = "#{user.id}"
        redirect_to users_path
        else
          session[:user] = nil
          redirect_to :back
      end
      puts "#{session[:user]}"
   end

   def digest(param_to_digest)
      sha256 = Digest::SHA256.new
      @digest = sha256.update param_to_digest.to_s
   end
end
