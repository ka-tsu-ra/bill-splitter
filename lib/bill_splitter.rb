require 'sinatra/base'
require './lib/bill_split_logic.rb'

class BillSplitter < Sinatra::Base

  enable :sessions

  get '/' do
    'Hello BillSplitter!'
    erb :index
  end

  post '/split_bill' do
    session[:bill_total] = params[:bill_total].to_i
    session[:people_count] = params[:people_count].to_i
    redirect "/split_bill"
  end

  get '/split_bill' do
    @amount = BillSplitterLogic.split_bills(session[:bill_total], session[:people_count]).to_s
    erb :split_bill
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
