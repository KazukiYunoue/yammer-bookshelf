class SessionsController < ApplicationController
  skip_before_filter :auth, :only => ["create"]

  def create
    auth = request.env["omniauth.auth"]
    user = User.find_by_provider_and_uid(auth["provider"], auth["uid"]) || User.create_with_omniauth(auth) 
    session[:user_id] = user.id
    redirect_to :root, :notice => "Signed in!"
  end

  def destroy
    reset_session
    redirect_to :root, :notice => "Sigined out!"
  end
end
