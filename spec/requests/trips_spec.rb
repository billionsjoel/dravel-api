require 'rails_helper'

describe 'Trips Api', type: :request do
  it 'sends a list of trips' do
    FactoryBot.create(:trip, name: 'Trip 1',
                             destination: 'Abuja', vip: 45.7, price: 100,
                             image: 'https://images.unsplash.com/', description: 'Trip 1 description')

    FactoryBot.create(:trip, name: 'Trip 2',
                             destination: 'Abuja', vip: 45.7, price: 150,
                             image: 'https://images.unsplash.com/', description: 'Trip 2 description')
    get '/trips'

    expect(response).to have_http_status(200)
    expect(JSON.parse(response.body).size).to eq(2)
  end
end
