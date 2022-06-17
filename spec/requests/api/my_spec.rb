require 'swagger_helper'

RSpec.describe 'Dravel API' do
  path '/users' do
    post 'Creates a user' do
      tags 'Users'
      consumes 'application/json'
      parameter name: :user, in: :body, schema: {
        type: :object,
        properties: {
          email: { type: :string },
          user_name: { type: :string },
          password: { type: :number }
        },
        required: %w[email user_name password]
      }

      response '201', 'user created' do
        let(:user) { { email: 'arnie@gmail.com', user_name: 'Udo', password: 'udo12345' } }
        run_test!
      end

      response '422', 'invalid request' do
        let(:user) { { name: 'Udo' } }
        run_test!
      end
    end
  end

  path '/users' do
    get 'Retrieves a user' do
      tags 'Users', 'Another Tag'
      produces 'application/json', 'application/xml'
      parameter user_name: :id, in: :path, type: :string

      response '200', 'user found' do
        schema type: :object,
               properties: {
                 id: { type: :integer },
                 email: { type: :string },
                 user_name: { type: :string },
                 password: { type: :integer }
               },
               required: %w[id email user_name password]

        let(:id) { User.create(email: 'arnie@gmail.com', user_name: 'Udo', password: 'udo12345').id }
        run_test!
      end

      response '404', 'user not found' do
        let(:id) { 'invalid' }
        run_test!
      end

      response '406', 'unsupported accept header' do
        let(:Accept) { 'application/trip' }
        run_test!
      end
    end
  end

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

  path '/trips/{trip_id}' do
    delete 'Delete a trip' do
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

      response '201', 'trip deleted' do
        let(:trip) { { name: 'medical', destination: 'Abuja', vip: 'true', price: '45', image: 'https://imagurl', description: 'A nice medical tourism' } }
        run_test!
      end

      response '422', 'invalid request' do
        let(:trip) { { name: 'medical' } }
        run_test!
      end
    end
  end

  path '/trips/{trip_id}/reservations' do
    post 'Creates a reservation' do
      tags 'Reservations'
      consumes 'application/json'
      parameter name: :reservation, in: :body, schema: {
        type: :object,
        properties: {
          date: { type: :datetime }
        },
        required: ['date']
      }

      response '201', 'reservation created' do
        let(:reservation) { { date: '2022-06-19 11:00:05 -0700' } }
        run_test!
      end

      response '422', 'invalid request' do
        let(:reseravtion) { { date: '2022-06-19 11:00:05 -0700' } }
        run_test!
      end
    end
  end

  path '/trips/{trip_id}/reservations/{id}' do
    get 'Retrieves a reservation' do
      tags 'Reservations', 'Another Tag'
      produces 'application/json', 'application/xml'
      parameter name: :id, in: :path, type: :integer

      response '200', 'trip found' do
        schema type: :object,
               properties: {
                 id: { type: :integer },
                 date: { type: :datetime }
               },
               required: %w[id date]

        let(:id) { Reservation.create(date: '2022-06-19 11:00:05 -0700 ').id }
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

  path '/trips/{trip_id}/reservations/{reservation_id}' do
    delete 'Delete a reservation' do
      tags 'Reservations'
      consumes 'application/json'
      parameter name: :reservation, in: :body, schema: {
        type: :object,
        properties: {
          date: { type: :datetime }
        },
        required: ['date']
      }

      response '201', 'reservation deleted' do
        let(:reservation) { { date: '2022-06-19 11:00:05 -0700' } }
        run_test!
      end

      response '422', 'invalid request' do
        let(:reseravtion) { { date: '2022-06-19 11:00:05 -0700' } }
        run_test!
      end
    end
  end
end
