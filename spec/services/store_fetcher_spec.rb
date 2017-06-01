require 'rails_helper'

describe 'it can return a list of stores' do
  it 'give it a zip and it returns a prettified object for each store' do
    VCR.use_cassette 'services/api_response' do
          stores = StoreFetcher.new.get_store(80202)
          expect(stores.count).to eq(10)
       end
  end
end
