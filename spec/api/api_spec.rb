require 'rails_helper'

describe 'When using the API' do
  it 'GET request to api/v1/items' do
    Item.create(name: "item",
                description: "some text",
                image_url: "https://placehold.it/300x300.png/000")

    Item.create(name: "item2",
                description: "some more text",
                image_url: "https://placehold.it/300x300.png/000")
    get '/api/v1/items'
    expect(response).to be_succes
    body = JSON.parse(response.body)
    expect(body.count).to eq(Item.count)
  end
  it 'GET request to api/v1/items/:id' do
    item = Item.create(name: "item",
                description: "some text",
                image_url: "https://placehold.it/300x300.png/000")

    Item.create(name: "item2",
                description: "some more text",
                image_url: "https://placehold.it/300x300.png/000")
    get "/api/v1/items/#{item.id}"
    expect(response).to be_succes
    body = JSON.parse(response.body)
    expect(body['name']).to eq(item.name)
  end
  it 'DELETE request to api/v1/items/1' do
    item = Item.create(name: "item",
                description: "some text",
                image_url: "https://placehold.it/300x300.png/000")

    Item.create(name: "item2",
                description: "some more text",
                image_url: "https://placehold.it/300x300.png/000")
    expect(Item.count).to eq(2)
    delete "/api/v1/items/#{item.id}"
    expect(response).to be_success
    expect(Item.count).to eq(1)
  end
  it 'POST request to api/v1/items' do
    expect(Item.count).to eq(0)
    post "/api/v1/items?name=thing&description=some text&image_url=https://www.google.com"
    expect(Item.count).to eq(1)
    expect(Item.all.last.name).to eq('thing')
  end
end
# We need an API for the application that can both read and write data. Start by focusing on functionality for items. All of this should happen in a dedicated, versioned controller.
#
# When I send a GET request to `/api/v1/items`
# I receive a 200 JSON response containing all items
# And each item has an id, name, description, and image_url but not the created_at or updated_at
#
# When I send a GET request to `/api/v1/items/1`
# I receive a 200 JSON response containing the id, name, description, and image_url but not the created_at or updated_at
#
# When I send a DELETE request to `/api/v1/items/1`
# I receive a 204 JSON response if the record is successfully deleted
#
# When I send a POST request to `/api/v1/items` with a name, description, and image_url
# I receive a 201 JSON  response if the record is successfully created
# And I receive a JSON response containing the id, name, description, and image_url but not the created_at or updated_at
