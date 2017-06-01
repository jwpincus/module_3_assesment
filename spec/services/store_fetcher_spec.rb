require 'rails_helper'

describe 'it can return a list of stores' do
  it 'give it a zip and it returns a prettified object for each store' do
    VCR.use_cassette "services/api_response" do
          new_query = StoreFetcher.new("80202")
          stores = new_query.get_store
          expect(stores.first).to respond_to(:city)
          expect(stores.first).to respond_to(:name)
          expect(stores.first).to respond_to(:phone)
          expect(stores.first).to respond_to(:store_type)
          expect(stores.first).to respond_to(:distance)
          number_of_stores = new_query.number_of_stores
          expect(number_of_stores).to eq(16)
       end
  end
end
