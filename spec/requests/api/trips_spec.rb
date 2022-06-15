require 'swagger_helper'

RSpec.describe 'Dravel API' do
  path '/trips' do
    post 'Creates a trip' do
      tags 'Trips'
      consumes 'application/json'
      parameter name: :trip, in: :body, schema: {
        type: :object,
        properties: {
          name: { type: :string },
          destination: { type: :string },
          vip: { type: :number },
          price: { type: :number },
          image: { type: :string },
          description: { type: :string }
        },
        required: %w[name destination vip price image description]
      }

      response '201', 'trip created' do
        let(:trip) { { name: 'medical', destination: 'Abuja', vip: 'true', price: '45', image: 'https://imagurl', description: 'A nice medical tourism' } }
        run_test!
      end

      response '422', 'invalid request' do
        let(:trip) { { name: 'medical' } }
        run_test!
      end
    end
  end
end

RSpec.describe 'Dravel API' do
  path '/trips' do
    get 'Retrieves a trip' do
      tags 'Trips', 'Another Tag'
      produces 'application/json', 'application/xml'
      parameter name: :id, in: :path, type: :integer

      response '200', 'trip found' do
        schema type: :object,
               properties: {
                 id: { type: :integer },
                 name: { type: :string },
                 destination: { type: :string },
                 vip: { type: :boolean },
                 price: { type: :number },
                 image: { type: :string },
                 description: { type: :string }
               },
               required: %w[id name destination vip price image description]

        let(:id) do
          Trip.create(name: 'medical', destination: 'Abuja', vip: 'true', price: 45, image: 'imageurl',
                      description: 'A medical tourism').id
        end
        run_test!
      end

      response '404', 'blog not found' do
        let(:id) { 'invalid' }
        run_test!
      end

      response '406', 'unsupported accept header' do
        let(:Accept) { 'application/trip' }
        run_test!
      end
    end
  end
end
