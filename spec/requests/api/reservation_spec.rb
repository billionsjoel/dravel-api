require 'swagger_helper'

RSpec.describe 'Dravel API' do
  path '/users/{user_id}/reservations' do
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
        let(:reservation) { { date: '2022-06-19' } }
        run_test!
      end

      response '422', 'invalid request' do
        let(:reseravtion) { { date: '2022-06-19' } }
        run_test!
      end
    end
  end

  path '/users/{user_id}/reservations/{id}' do
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

        let(:id) { Reservation.create(date: '2022-06-19').id }
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
