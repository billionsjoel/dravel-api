require 'rails_helper'

describe "Trips Api", type: :request do 
  it "sends a list of trips" do
    FactoryBot.create(:trip, name: "Trip 1",destination: "Abuja", vip: 45.7, price: "100", image: "https://images.unsplash.com/photo-1518791841217-8f162f1e1131?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60", description: "Trip 1 description")

    FactoryBot.create(:trip, name: "Trip 2",destination: "Abuja", vip: 45.7, price: "100", image: "https://images.unsplash.com/photo-1518791841217-8f162f1e1131?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60", description: "Trip 1 description")
    get "/trips"
    
    expect(response).to have_http_status(302)
    expect(JSON.parse(response.body).size).to eq(2)

  end
end

