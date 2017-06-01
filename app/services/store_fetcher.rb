class StoreFetcher

  def get_store(zip)
    json = get_raw(zip)
    parsed = parser(json)
    stores = []
    parsed.each do |store|
      stores << Prettifier.new(store)
    end
    stores[10] = JSON.parse(json)['total']
    stores
  end

  def get_raw(zip)
    Faraday.get("https://api.bestbuy.com/v1/stores((area(#{zip},25)))?apiKey=#{ENV['api_key']}&show=longName,city,phone,storeType,distance&format=json").body
  end

  def parser(json)
    parsed = JSON.parse(json)
    parsed = parsed['stores']
  end
end
