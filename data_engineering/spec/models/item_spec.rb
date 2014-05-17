require 'spec_helper'

describe Item do
  it { should respond_to(:description) }
  it { should respond_to(:price) }
  it { should respond_to(:merchant) }
  it { should respond_to(:purchases) }
end
