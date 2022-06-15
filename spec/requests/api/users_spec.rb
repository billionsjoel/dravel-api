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
end
