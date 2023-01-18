require 'rails_helper'

RSpec.describe Query, type: :model do
  before(:each) do
    @user = User.create!(name: 'Vitor', email: 'vgm_rox@hotmail.com', password: 123321)
  end

  let(:valid_attributes) do
    {
      body: 'Testing query',
      user: @user
    }
  end

  subject { Query.new valid_attributes }

  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end

  it 'is not valid without a body' do
    subject.body = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid without an user' do
    subject.user = nil
    expect(subject).to_not be_valid
  end

  it 'Query\'s body should return Testing query' do
    expect(subject.body).to eq('Testing query')
  end
end