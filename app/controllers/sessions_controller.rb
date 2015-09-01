class SessionsController < ApplicationController
  layout "sessions"
  def new
  end
  def create
    user = User.authenticate(params[:email], params[:password])
    if user
      session[:user_id] = user.id
      if params[:password] == user.cuenta.to_s
        redirect_to "/users/"+user.id.to_s+"/edit", :notice => "Cambia tu contraseña."
      else
        redirect_to "/requests", :notice => "Conectado!"
      end
    else
      redirect_to root_url, :notice => "Correo o contraseña incorrecto!"
    end
  end
  def destroy
    session[:user_id] = nil
    redirect_to root_url, :notice => "Sesion cerrada!"
  end
end
