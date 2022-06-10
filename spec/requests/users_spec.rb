require 'rails_helper'

describe "list of users" do
  it "sends a list of users" do
    FactoryBot.create(:user, email: "arnie@yahoo.com", user_name: "Arnie", password: "password")
    get "/users/sign_up"
    
    expect(response).to have_http_status(200)
  end
  
end
