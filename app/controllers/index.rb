
get '/' do
  # tracks site visits
  if Counter.last
    old = Counter.first.pagevisits
    newvisits = old + 1
    Counter.first.update(pagevisits: newvisits)
  end

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
  if Counter.first
    resets = Counter.first.siteresets
    newresets = resets + 1
    Counter.first.update(siteresets: newresets)
  else
  end
  redirect '/'
end

get '/help' do 

  erb :help
end

post '/submit' do 
  if Order.last == nil 
    @error = "no database"
    erb :"results/search"
  else
  old = Counter.first.barcodesgenerated
  newbarcodesgenerated = old + params[:amountso].to_i
  Counter.first.update(barcodesgenerated: newbarcodesgenerated)

    # get how many to search for
    # put random objects into an array
    # send array to erb page for render
    @numberso = params[:amountso]
    @sossarray = []

    # getting random from Database
    @numberso.to_i.times do |soss|
      @sossarray << Order.offset(rand(Order.count)).first
    end

    erb :"results/results"
  end
end

post '/create' do 
  old = Counter.first.barcodescreated
  newbarcodescreated = old + 1
  Counter.first.update(barcodescreated: newbarcodescreated)

  # Create a new entry
  @newsoss = Order.create(bol_no: params[:bol_no],created_at: params[:created_at],customer_order_no: params[:customer_order_no],ship_from_company: params[:ship_from_company],ship_from_address: params[:ship_from_address],ship_from_zip_code: params[:ship_from_zip_code],ship_to_company: params[:ship_to_company],ship_to_address: params[:ship_to_address],ship_to_zip_code: params[:ship_to_zip_code],date: params[:date],time: params[:time],dow: params[:dow],month: params[:month],hour: params[:hour],haserror: params[:haserror], deleteme: params[:haserror])
  erb :new
end

post '/search' do 

  if Order.last == nil 
    @error = "no database"
    erb :"results/search"
  else
    # if looking for last 10 or so, fills into @lastamount or stays nil
    # if lastamount is empty, search database for string and int values of BOL and SOSS
  @lastamount = params[:amountlast] || nil

  if @lastamount.length >= 1
    erb :lastamounts
  else 
    @result = Order.find_by(bol_no: params[:findbynum])
    if @result == nil
      @result = Order.find_by(bol_no: params[:findbynum].to_s)
      if @result == nil
        @result = Order.find_by(customer_order_no: params[:findbynum])
        if @result == nil 
          @result = Order.find_by(customer_order_no: params[:findbynum].to_s)
          if @result == nil 
            end
          end
        end
      end
      erb :result
    end
  end
end

post '/removeCompletedData' do 
  if Order.last == nil 
    @error = "no database"
    erb :search
  else
    # sorts through data looking for if any data is missing. If the object is complete it is flagged for deletion.
    # this is version 1 of what will soon be a auditing program for BOL SOSS reports.

    @testorders = Order.all 
    @testorders.each do |test|
      errorCounter = 0

      if test.bol_no == nil
        errorCounter += 1
      end
      if test.created_at == nil
        errorCounter += 1
      end
      if test.customer_order_no == nil
        errorCounter += 1
      end
      if test.ship_from_company == nil
        errorCounter += 1
      end
      if test.ship_from_address == nil
        errorCounter += 1
      end
      if test.ship_from_zip_code == nil
        errorCounter += 1
      end
      if test.ship_to_company == nil
        errorCounter += 1
      end
      if test.ship_to_address == nil
        errorCounter += 1
      end
      if test.ship_to_zip_code == nil
        errorCounter += 1
      end
      if test.date == nil
        errorCounter += 1
      end
      if test.time == nil
        errorCounter += 1
      end
      if test.dow == nil
        errorCounter += 1
      end
      if test.month == nil
        errorCounter += 1
      end
      if test.hour == nil
        errorCounter += 1
      end

      if errorCounter >= 1
        test.update(deleteme: "no")
      else
        test.update(deleteme: "yes")
      end
    end
    erb :search
  end
end

post '/cleardata' do
  if Order.last == nil 
    @error = "no database"
    erb :search
  else

    # runs through database, if deleteme == yes, it will be deleted

    @order = Order.all
    @order.each do |soss|

      if soss.deleteme == "yes"
        soss.destroy!
      elsif soss.deleteme == "no"
        p "saved " + soss.bol_no.to_s + "! It has an error reported"
      else
        p "saved " + soss.bol_no.to_s + "! system could not determine if safe to delete"
      end
    end
    erb :search
  end
end


post '/generatetests' do 
  
  require 'rubygems'
  require 'faker'

  old = Counter.first.barcodesgenerated
  newbarcodesgenerated = old + params[:amountsoss].to_i + params[:amountpallets].to_i + params[:amountcartons].to_i
  Counter.first.update(barcodesgenerated: newbarcodesgenerated)

  old = Counter.first.cartonsgenerated
  newcartonsgenerated = old + params[:amountcartons].to_i
  Counter.first.update(cartonsgenerated: newcartonsgenerated)

  old = Counter.first.palletsgenerated
  newpalletsgenerated = old + params[:amountpallets].to_i
  Counter.first.update(palletsgenerated: newpalletsgenerated)

  old = Counter.first.sossgenerated
  newsossgenerated = old + params[:amountsoss].to_i
  Counter.first.update(sossgenerated: newsossgenerated)


  # generates FAKE data for users to test TOUCH and other scanning apps.

  @amountsoss = params[:amountsoss]
  @amountpallets = params[:amountpallets]
  @amountcartons = params[:amountcartons]
  erb :test 
end

  




