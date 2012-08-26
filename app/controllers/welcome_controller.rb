class WelcomeController < ApplicationController
  skip_before_filter :auth

  def index
  end

end
