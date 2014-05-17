require 'spec_helper'

describe Merchant do
  it { should respond_to(:name) }
  it { should respond_to(:address) }
  it { should respond_to(:items) }
end
