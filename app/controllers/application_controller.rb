require "sinatra"
require "sinatra/activerecord"

module ChatDemo
  class ApplicationController < Sinatra::Base
    set :default_content_type, 'application/json'
    
    # GET ROUTES
    get "/" do
      { message: "Welcome to GUMZO" }.to_json
    end

    get '/users' do
      all_users = User.all
      all_users.to_json(include: :messages)
    end

    get '/messages' do
      all_messages = Message.all
      all_messages.to_json()
    end

    get '/messages/:id' do
      single_message = Message.find(params[:id])
      single_message.to_json(include: :user)
    end

    get '/users/:id' do
      single_user = User.find(params[:id])
      single_user.to_json(include: :messages)
    end

    # POST ROUTES
    post '/messages' do
      send_it = Message.create(
        body: params[:body],
        user_id: params[:user_id],
      )
      send_it.to_json
    end

    # DELETE ROUTES
    delete '/messages/:id' do
      take_out = Message.find(params[:id])
      take_out.destroy
      take_out.to_json
    end

    # PATCH ROUTES
    patch '/users/:id' do
      user = User.find(params[:id])
      user.update(
        name: params[:name],
        password: params[:password]
      )
      user.to_json
    end

  end
end