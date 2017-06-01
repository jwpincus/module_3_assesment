class SearchController < ApplicationController
  def index
    fetched = StoreFetcher.new(params[:zip])
    @stores = fetched.get_store
    @number_of_stores = fetched.number_of_stores
  end
end
