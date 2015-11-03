class RolesController < ApplicationController
#before_filter :session_filter
layout 'admin'

  def roles
    @roles = Role.all
  end

  def create
    permissions = params[:permissions]
    role = Role.create(title: params[:role][:title], active_role: true)
    if role.save
    permissions.each do |permission|
     p = params[:permissions][permission[0]][:permission]
     a = params[:permissions][permission[0]][:active] if !params[:permissions][permission[0]][:active].nil?
     a = 0 if params[:permissions][permission[0]][:active].nil?
     m = params[:permissions][permission[0]][:modul]
     permission = Permission.create(permission: p, active: a, role_id: role.id, modul: m)
    end
    flash[:notice] = "El rol ha sido creado"
    else
    flash[:notice] = "El rol no ha sido guardado correactamente"
    end
    redirect_to :back
  end

  def update
  end

  def destroy
    @role = Role.find(params[:id])
    @role.destroy

    flash[:notice] = "Rol eliminado"
    redirect_to :back
  end

  def new
  end
  
private 

  def session_filter
   if session[:user] == nil
      redirect_to login_user_path
   end
  end
end
