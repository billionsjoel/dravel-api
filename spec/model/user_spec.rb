require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Test for the User Validation' do
    subject { User.new(email: 'john@mail.com', user_name: 'John', password: 'john') }
    before { subject.save }

    it 'if there is name' do
      subject.user_name = nil
      expect(subject).to_not be_valid
    end

    it 'if there is email' do
      subject.email = nil
      expect(subject).to_not be_valid
    end

    it 'if password length is under 6' do
      subject.password = 1111
      expect(subject).to_not be_valid
    end
  end
end
