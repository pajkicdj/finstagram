

###################



 #def humanized_time_ago(time_ago_in_minutes)   
 #   if time_ago_in_minutes >= 60
 #       "#{time_ago_in_minutes/60}h"
 #   else
 #       "#{time_ago_in_minutes}m"
 #   end
#end

# the '/' is the home page!!!
#these get methods will be used for EVERY page :)
helpers do
    def current_user
        User.find_by(id: session[:user_id])
    end
end


get '/' do #doesn't like curly brackets ugh and the '/' is the request path aka the directory 
    if current_user
        @posts = Post.order(created_at: :desc)
        erb(:index)
    else
        erb(:login)
    end
end

get '/signup' do
    @user = User.new
    erb :signup
end

post '/signup' do
   # grab user input values from params
   email = params[:email] 
   avatar_url = params[:avatar_url]
   username = params[:username]
   password = params[:password]
   
   #instantiate a User
   @user = User.new({ email: email, avatar_url: avatar_url, username: username, password: password })
   
   #if user validations pass and user is saved
   if @user.save
       #return readable representation of User object
       #escape_html user.inspect
       redirect(to('/login'))
   else
       #display error message
       #escape_html user.errors.full_messages
       erb(:signup)
   end
end

get '/login' do 
    erb(:login)
end

post '/login' do
    username = params[:username]
    password = params[:password]
    
    user = User.find_by(username: username)
    
    if user && user.password == password
        session[:user_id] = user.id
        redirect(to('/'))
    else
        @error_message = "Login failed."
        erb(:login)
    end
end

get '/logout' do
    session[:user_id] = nil
    #or session.clear!!!
#    erb(:login)
    redirect(to('/login'))
end


get '/posts/new' do
    @post = Post.new
    erb(:"posts/new")
end

post '/posts' do
    photo_url = params[:photo_url]
    
    @post = Post.new({photo_url: photo_url, user_id: current_user.id})
    
    if @post.save
        redirect(to('/'))
    else
        erb(:"posts/new")
    end
end



get '/posts/:id' do
    @post = Post.find(params[:id])
    erb(:"posts/show")
end



post '/comments' do
    text = params[:text]
    post_id = params[:post_id]
    
    comment = Comment.new({ text: text, post_id: post_id, user_id: current_user.id})
    
    comment.save
    
    redirect(back)
end

post '/likes' do
    post_id = params[:post_id]
    
    like = Like.new({ post_id: post_id, user_id: current_user.id })
    like.save
    
    redirect(back)
end

delete '/likes/:id' do
    like = Like.find(params[:id])
    like.destroy
    redirect(back)
end












#create a new page!!
#look at this page when given a request for the about page

get '/about' do
  @company_name = "Lighthouse Labs"
  @employees = [
    {name: "Alex", years: 5},
    {name: "Leigh", years: 1},
    {name: "Maggie", years: 10}
  ]
  erb :about  #it will look for a file called about.erb in the app views folder #doesn't have to be first?
end

get '/contact' do
  "Contact us"
  erb :contact
end


#get '/' do
#    @posts = Post.all
#    erb: index
#end