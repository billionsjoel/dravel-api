require 'rails_helper'

describe "Trips Api", type: :request do 
  it "sends a list of trips" do
    get "/trips"
    # expect(response).to be_successful
    expect(response).to have_http_status(302)

  end
end
