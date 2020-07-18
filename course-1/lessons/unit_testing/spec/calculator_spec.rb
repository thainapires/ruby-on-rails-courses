require 'rspec'
require_relative '../calculator'

describe Calculator do
    before { @calculator = Calculator.new('RSpec calculator')}

    it "should add 2 numbers correctly" do
        expect(@calculator.add(2,2)).to eq 4
    end

    it "should subtract 2 numbers correctly" do
        expect(@calculator.subtract(4,2)).to eq 2
    end
end

