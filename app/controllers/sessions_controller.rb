class SessionsController < ApplicationController
  layout "sessions"
  def new
  end
  def create
    user = User.authenticate(params[:email], params[:password])
    user_existe = User.where(:email => params[:email]).exists?

    if user
      session[:user_id] = user.id
      if params[:password] == user.cuenta.to_s
        redirect_to "/users/"+user.id.to_s+"/edit", :notice => "Cambia tu contraseña."
      else
        redirect_to "/requests", :notice => "Conectado!"
      end
    elsif !user_existe
      redirect_to root_url, :notice => "Usuario no existe, crea una cuenta con tu coordinador."
    else
      redirect_to root_url, :notice => "Correo o contraseña incorrecta! Si has olvidado tu contraseña, la puedes reestablecer con tu coordinador."
    end
  end
  def destroy
    session[:user_id] = nil
    redirect_to root_url, :notice => "Sesion cerrada!"
  end
end
