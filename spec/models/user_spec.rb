# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  email      :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'spec_helper'

module UserSpecHelper
  def new_user_with params
    User.new( @user_attr.merge params )
  end
end

describe User do
  include UserSpecHelper

  before :all do
    @user_attr = { :name => "Example User", :email => "user@example.com" }
  end

  it 'should not raise error when creating one with a correct attributes' do
    expect { User.create! @user_attr }.to_not raise_error ActiveRecord::RecordInvalid
  end

  [:name, :email].each do|required_field|
    it "should require a #{required_field}" do
      new_user_with( required_field => '' ).should_not be_valid
    end
  end

  it 'should reject too long name' do
    new_user_with( name: 'a' * 51 ).should_not be_valid;
  end

  it 'should accept a user whose name is as long as 50' do
    new_user_with( name: 'a' * 50 ).should be_valid;
  end

  it 'should accept valid email addresses' do
    %w[user@acme.com THE_USER@valid.org first.last@example.jp].each do|address|
      new_user_with( email: address ).should be_valid
    end
  end

  it 'should reject invalid email addresses' do
    %w[user@acme,com user_at_invalid.org user@example.].each do|address|
      new_user_with( email: address ).should_not be_valid
    end
  end
end
