class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_user
  helper_method :modules
  helper_method :scope_permission
  helper_method :host
  helper_method :agent
  helper_method :lang

  def current_user
    @user = User.find_by_id(session[:user])
  end
  
  def lang
    lang = session[:lang]
    if lang.nil?
      lang = "es"
    end
  end
  def modules
    modules_array = []    
    modules = ['users','blog_posts', 'roles', 'formats']
    actions = ['create', 'upadate', 'delete', 'view', 'view_all']
    modules.each do |m|
      actions.each do |a|
        modules_array.push([m,a])
      end
    end
    modules_array
  end

  def scope_permission(module_call, permission)
    action = current_user.role.permissions.where(modul: module_call, permission: permission) if current_user.role != nil
    action = "sin rol" if current_user.role == nil
    action = action.map {|a| a.active}
    puts "#{action[0]}>>>>>>>>>>>>>>>>>>>"
    action[0]
  end

  def host 
    @hostname = request.host_with_port || "www.capama.gob.mx"
  end

  def agent
    result  = request.env['HTTP_USER_AGENT']
    puts result
      if result =~ /iPhone|Android|iPad/
        @browser = "Mobile"
        @mobile = true
      else
      case 
      when result =~ /Chrome/
        @browser = "Google Chrome"
        @mobile = false
      when result =~ /Firefox/
        @browser = "Firefox"
        @mobile = false
      when result =~ /Safari/
        @browser = "Safari"
        @mobile = false
      when result =~ /MSIE/
        @browser = "Internet Explorer"
        @mobile = false        
      end 
      end
    puts "********************** #{@browser} / Mobile: #{@mobile} ************************" 
       @mobile
  end

end
