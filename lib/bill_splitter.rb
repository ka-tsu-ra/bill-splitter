require 'sinatra/base'
require './lib/bill_split_logic.rb'
require 'pry'

class BillSplitter < Sinatra::Base

  enable :sessions

  get '/' do
    'Hello BillSplitter!'
    erb :index
  end

  post '/split_bill' do
    session[:bill_total]       = params[:bill_total].to_i
    session[:total_booze]      = params[:total_booze].to_i
    session[:total_softdrinks] = params[:total_softdrinks].to_i
    session[:people_count]     = params[:people_count].to_i
    session[:boozers]          = params[:boozers].to_i
    session[:soft_drinkers]    = params[:soft_drinkers].to_i
    session[:no_drinkers]      = params[:no_drinkers].to_i
    redirect "/split_bill"
  end

  get '/split_bill' do
    bill_splitter_logic = BillSplitterLogic.new(session[:bill_total], session[:people_count], session[:total_booze], session[:boozers], session[:total_softdrinks], session[:soft_drinkers])

    @bill_split = bill_splitter_logic.split_bill
    erb :split_bill
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
