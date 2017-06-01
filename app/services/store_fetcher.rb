class StoreFetcher

  def get_store(zip)
    json = get_raw(zip)
    parser(json).map do |day|
      Prettifier.new(day)
    end
  end

  def get_raw(zip)
    Faraday.get("https://api.bestbuy.com/v1/stores((area(80202,10)))?apiKey=#{ENV['api_key']}&show=longName,city,phone,storeType,distance&format=json").body
  end

  def parser(json)
    binding.pry
    parsed = JSON.parse(json)
    parsed = parsed
  end
end
