class SessionsController < ApplicationController

  def create
    envhash = env["omniauth.auth"]

    if user = User.where(envhash.slice("provider", "uid").permit(:uid)).first
      user.update_attributes("provider" => envhash["provider"], "uid" => envhash["uid"], "name" => 
      envhash["info"]["name"], "handle" => envhash["info"]["nickname"], "image" => envhash["info"]["image"])
    else
    user = User.new("provider" => envhash["provider"], "uid" => envhash["uid"], "name" => envhash["info"]["name"], "handle" => envhash["info"]["nickname"], "image" => envhash["info"]["image"])
    user.save
  end

    session[:user_id] = user.id
    redirect_to root_url, notice: "Signed In"
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, notice: "Signed Out"
  end
end
