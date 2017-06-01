class SearchController < ApplicationController
  def index
    fetched = StoreFetcher.new
    @stores = fetched.get_store(params[:zip])
    @number_of_stores = fetched.number_of_stores
  end
end
