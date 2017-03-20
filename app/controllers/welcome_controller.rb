class WelcomeController < ApplicationController
  http_basic_authenticate_with name: "nihar", password: "secret",
   except: [ :show]
  def index
  end
end
