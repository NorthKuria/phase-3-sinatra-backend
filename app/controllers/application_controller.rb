class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  
  # GET ROUTES
  get "/" do
    { message: "Welcome to GUMZO" }.to_json
  end

  get '/users' do
    all_users = User.all
    all_users.to_json()
  end

  get '/messages' do
    all_messages = Message.all
    all_messages.to_json()
  end

  # POST ROUTES

  # DELETE ROUTES

  # PATCH ROUTES
end
