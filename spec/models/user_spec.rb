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

describe User do
  before :all do
    @user_attr = { :name => "Example User", :email => "user@example.com" }
  end

  it 'should not raise error when creating one with a correct attributes' do
    expect { User.create! @user_attr }.to_not raise_error ActiveRecord::RecordInvalid
  end

  [:name, :email].each do|required_field|
    it "should require a #{required_field}" do
      User.new( @user_attr.merge required_field => '' ).should_not be_valid
    end
  end
end
