require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    it { is_expected.to validate_length_of(:username).is_at_least(2).is_at_most(10) }
  end

  describe 'Validations' do
    let(:attributes) { { username: 'Goku', password: '123456' } }
    let(:user) { User.create(attributes) }
    subject { user.valid? }

    it { expect(subject).to be true }

    context 'username' do
      let(:attributes) { { username: 'G', password: '123456' } }

      context 'is invalid when username is less than 2 characters' do
        it do
          is_expected.to be false
          expect(user.errors.full_messages).to include('Username is too short (minimum is 2 characters)')
        end
      end
    end
  end
end
