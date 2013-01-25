require 'spec_helper'

describe Gem::Diet do
  it 'should have a version number' do
    Gem::Diet::VERSION.should_not be_nil
  end

  it 'should do something useful' do
    false.should be_true
  end
end
