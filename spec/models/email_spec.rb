require 'rails_helper'

RSpec.describe Email, type: :model do
  #############
  # Validations
  #############
  
  it { should validate_presence_of :value }
  
  describe 'validating uniqueness' do
    before { create :email }
    it { should validate_uniqueness_of(:value).case_insensitive }
  end
  
  describe 'validating format' do
    it { should allow_value('bob@example.com').for(:value) }
    it { should allow_value('bob123@example.com').for(:value) }
    it { should allow_value('bob@example.something.com').for(:value) }
    it { should allow_value('bob.something@example.com').for(:value) }

    it { should_not allow_value('bob@example').for(:value) }
    it { should_not allow_value('example.com').for(:value) }
    it { should_not allow_value('http://example.com').for(:value) }
    it { should_not allow_value('bob').for(:value) }
  end
  
  ###########
  # Callbacks
  ###########

  describe '#downcase' do
    let(:email) { build :email, value: value }
    let(:value) { 'test@example.com' }
    
    it "is called before validation" do
      expect(email).to receive(:downcase).once
      email.valid?
    end
    
    describe 'resulting value' do
      before { email.valid? }
      subject { email.value }
      
      describe 'when already lowercase' do
        let(:value) { 'test@example.com' }
        it { should eq(value) }
      end
      
      describe 'with uppercase letters' do
        let(:value) { 'TEST@ExAmPlE.CoM' }
        it { should eq('test@example.com') }
      end
    end
  end
end
