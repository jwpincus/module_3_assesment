class SearchController < ApplicationController
  before_action :check_zip
  def index
    fetched = StoreFetcher.new(params[:zip])
    @stores = fetched.get_store
    @number_of_stores = fetched.number_of_stores
  end

  private

  def check_zip(zip = params[:zip])
    if zip[/^\d{5}$/].nil?
      flash[:alert] = 'Please use a valid zip'
      redirect_to '/'
    end
  end
end
