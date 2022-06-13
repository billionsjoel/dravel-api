require 'rails_helper'

RSpec.describe Users, type: :routing do
  describe 'routing' do
    it 'routes to #new' do
      expect(get: '/users/sign_in').to route_to('users/sessions#new')
    end

    it 'routes to #show' do
      expect(get: '/users/1').to route_to('users#show', id: '1')
    end

    it 'routes to #edit' do
      expect(get: '/users/edit').to route_to('users/registrations#edit')
    end

    it 'routes to #create' do
      expect(post: '/users/sign_in').to route_to('users/sessions#create')
    end
  end
end
