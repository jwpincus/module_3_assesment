class Prettifier
  def initialize(store)
    @store = store
  end

  def name
    "Name: #{@store['longName']}"
  end

  def city
    "City: #{@store['city']} F"
  end

  def phone
    "Phone: #{@store['phone']} F"
  end

  def store_type
    "Store Type: #{@store['storeType']}"
  end

  def distance
    "Distance: #{@store['distance']}"
  end
end
