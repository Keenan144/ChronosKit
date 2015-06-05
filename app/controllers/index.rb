
get '/' do
  # tracks site visits
  # search.erb is empty now, used as landing page
  erb :"results/search"
end

get '/newsoss' do 
  erb :newsoss
end

get '/randomsoss' do 
  erb :randomsoss
end

get '/generaterandomsoss' do 
  erb :generaterandomsoss
end

get '/searchforsoss' do 
  erb :searchforsoss
end


get '/reset' do

  redirect '/'
end

get '/help' do 

  erb :help
end

post '/submit' do 
    # get how many to search for
    # put random objects into an array
    # send array to erb page for render
    @numberso = params[:amountso]
    @sossarray = []

    # getting random from Database

    erb :"results/results"
end

post '/create' do 
 erb :new
end

post '/search' do 

end

post '/removeCompletedData' do 

end

post '/cleardata' do

end


post '/generatetests' do 
  
  require 'rubygems'
  require 'faker'

  # generates FAKE data for users to test TOUCH and other scanning apps.

  @amountsoss = params[:amountsoss]
  @amountpallets = params[:amountpallets]
  @amountcartons = params[:amountcartons]
  erb :"results/test" 
end

  




