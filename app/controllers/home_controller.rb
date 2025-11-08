# require "sinatra"
# require "sinatra/activerecord"
# require "json"
class HomeController < ApplicationController
 skip_before_action :authenticate_user!, only: [:index]
end


# post '/signup' do
#   data = json_params
#   user = User.find_by(email: data["email"])
#   halt 400, { error: "Email already exists" }.to_json if user

#   new_user = User.new(
#     name: data["name"],
#     email: data["email"],
#     age: data["age"]
#   )
#   new_user.password = data["password"]
#   new_user.save

#   { message: "User created successfully" , new_user: { id: new_user.id, name: new_user.name, email: new_user.email, age: new_user.age } }.to_json
# end

# post '/login' do

#   params = json_params
#   email = params['email']
#   password = params['password']

#   halt 400, { error: 'Provide email and password' }.to_json unless email && password

#   user = User.find_by(email: email)
#   halt 404, { error: 'User not found in database' }.to_json unless user

#   if BCrypt::Password.new(user.password_digest) == password
#     token = generate_token(user)
#     { 
#       message: 'Login successful', 
#       token: token, 
#       user: { id: user.id, name: user.name, email: user.email, age: user.age } 
#     }.to_json
#   else
#     halt 401, { error: 'Invalid password' }.to_json
#   end
# end

# #Fetching all users form users table
# get "/users" do
#     protected!
#     User.all.to_json
# end

# Create new user 
# post "/users" do


#     content_type :json


#     data = JSON.parse(request.body.read)
#     user = User.create(
#         name: data["name"],
#         email: data["email"], 
#         age: data["age"])
#     status 201

#     {message: "User Created Successfully", user: user}.to_json
#     #user.to_json
# end


# Fetch user by ID

# get "/users/:id" do
#     protected!
#     content_type :json
#     user = User.find_by(id: params[:id])

#     if user
#         {message: "User Fetched Successfully", user: user}.to_json
#     else
#         status 400
#         {error: "User Not Found"}.to_json
#     end
# end

# #update user 
# put "/users/:id" do
#     protected!
#     content_type :json
#     user = User.find_by(id: params[:id])

#     if user
#         data = JSON.parse(request.body.read)
#         user.update(
#             name: data["name"],
#             email: data["email"],
#             age: data["age"]
#         )

#         {message: "User Updated Successfully", user: user}.to_json

#     else
#         status 400
#         {error: "User Not found"}.to_json
#     end
# end 

# #Deleting User

# delete "/users/:id" do
#     protected!
#     content_type :json

#     user = User.find_by(id: params[:id])

#     if user
#         user.destroy
#         {message: "User Deleted Successfully"}.to_json
#     else
#         status 400
#         {error: "user not found"}.to_json
#     end
# end