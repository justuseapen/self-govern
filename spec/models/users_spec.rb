require 'spec_helper'

describe User do
  it { should validate_presence_of :email }

  it { should_not have_valid(:email).when("hithere","hi@there","hithere.com") }
  it { should have_valid(:email).when("hi@there.com","yolo@gmail.com") }

  it { should have_many(:prompts).dependent(:nullify) }
  it { should have_many(:choices).dependent(:nullify) }
  it { should have_many(:comments).dependent(:nullify) }

end
