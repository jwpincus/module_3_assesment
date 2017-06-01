class SearchController < ApplicationController
  def index
    @stores = StoreFetcher.new.get_store(params[:zip])
  end
end
