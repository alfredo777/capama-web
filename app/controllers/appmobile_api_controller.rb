class AppmobileApiController < ApplicationController
  skip_before_filter :verify_authenticity_token
  def login
    @user = User.find_by_card(params[:card])

    unless @user.nil?
       password = corroborate_password(params[:password], "#{@user.password}")
    else
       password = false
    end

    if password 
       render json: {user: @user.to_json}
    else
       render json: {user: "Error al ingresar al usuario"}
    end

  end

private
protected
  def corroborate_password(password, pass)
    sha256 = Digest::SHA256.new
    @digest = sha256.update password.to_s
    puts @digest
    puts pass
    if "#{@digest}" == pass
      puts true
      true
    else
      puts false
      false
    end
  end
end
