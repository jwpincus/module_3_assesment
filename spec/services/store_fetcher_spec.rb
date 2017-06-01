require 'rails_helper'

describe 'it can return a list of stores' do
  it 'give it a zip and it returns a prettified object for each store' do
    VCR.use_cassette 'services/api_response' do
          stores = StoreFetcher.new.get_store("80202")
          expect(stores.first).to respond_to(:city)
          expect(stores.first).to respond_to(:name)
          expect(stores.first).to respond_to(:phone)
          expect(stores.first).to respond_to(:store_type)
          expect(stores.first).to respond_to(:distance)

       end
  end
end
