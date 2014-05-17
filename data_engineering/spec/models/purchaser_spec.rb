require 'spec_helper'

describe Purchaser do
  it { should respond_to(:name) }
  it { should respond_to(:purchases) }
end
