class StoreFetcher
  attr_accessor :get_raw
  def initialize(zip)
    @get_raw = Faraday.get("https://api.bestbuy.com/v1/stores((area(#{zip},25)))?apiKey=#{ENV['api_key']}&show=longName,city,phone,storeType,distance&format=json").body
  end
  def get_store
    parsed = parser(get_raw)
    parsed.map do |store|
      Prettifier.new(store)
    end
  end

  def number_of_stores
    JSON.parse(get_raw)['total']
  end

  def parser(json)
    parsed = JSON.parse(json)
    parsed = parsed['stores']
  end
end
