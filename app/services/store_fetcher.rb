class StoreFetcher

  def get_store(zip)
    json = get_raw(zip)
    parser(json).map do |day|
      Prettifier.new(day)
    end
  end

  def get_raw(zip)
    Faraday.get("").body
  end

  def parser(json)
    parsed = JSON.parse(json)
    parsed = parsed[]
  end
end
