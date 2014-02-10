require 'spec_helper'

describe Prompt do
  it { should validate_presence_of :text }

  it { should belong_to(:user) }
  it { should have_many(:choices).dependent(:destroy) }
  it { should have_many(:comments).dependent(:destroy) }
end
