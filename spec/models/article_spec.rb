require 'rails_helper'

RSpec.describe Article, type: :model do
  before(:each) do
    @user = User.create!(name: 'Vitor', email: 'vgm_rox@hotmail.com', password: 123321)
  end

  let(:valid_attributes) do
    {
      title: 'Testing title',
      description: 'Testing description Testing description Testing description Testing description Testing description Testing description Testing description Testing description Testing description Testing description',
      author: 'Testing author'
    }
  end

  subject { Article.new valid_attributes }

  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end

  it 'is not valid without a title' do
    subject.title = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid without a description' do
    subject.description = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid without an author' do
    subject.author = nil
    expect(subject).to_not be_valid
  end

  it 'Article\s title should return Testing title' do
    expect(subject.title).to eq('Testing title')
  end

  it 'Article\s description should return Testing description' do
    expect(subject.description).to eq('Testing description Testing description Testing description Testing description Testing description Testing description Testing description Testing description Testing description Testing description')
  end

  it 'Article\s author should return Testing author' do
    expect(subject.author).to eq('Testing author')
  end
end