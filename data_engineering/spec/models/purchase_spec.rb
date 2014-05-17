require 'spec_helper'

describe Purchase do
  it { should respond_to(:purchaser) }
  it { should respond_to(:item) }
  it { should respond_to(:quantity) }
end
