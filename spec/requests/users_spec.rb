require 'rails_helper'

describe 'Users registration' do
  it 'Register a new user' do
    FactoryBot.create(:user, email: 'arnie@yahoo.com', user_name: 'Arnie', password: 'password')
    get '/users/sign_up'

    expect(response).to have_http_status(200)
  end
end

describe 'Users log in' do
  it 'login a new user' do
    get '/users/sign_in'

    expect(response).to have_http_status(200)
  end
end
