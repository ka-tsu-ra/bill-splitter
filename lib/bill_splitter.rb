require 'sinatra/base'

class BillSplitter < Sinatra::Base

  enable :sessions

  get '/' do
    'Hello BillSplitter!'
    erb :index
  end

  post '/split_bill' do
    session[:bill_total] = params[:bill_total]
    session[:people_count] = params[:people_count]
    redirect "/split_bill"
  end

  get '/split_bill' do
    "£10"
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
