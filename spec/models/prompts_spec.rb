require 'spec_helper'

describe Prompt do
  it { should validate_presence_of :text }

  it { should belong_to(:user) }
end
