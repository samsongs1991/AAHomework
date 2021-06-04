require 'rspec'
require 'dessert'

=begin
Instructions: implement all of the pending specs (the `it` statements without blocks)! Be sure to look over the solutions when you're done.
=end

describe Dessert do
  subject { Dessert.new("sweet", 15, chef) }
  let(:chef) { double("chef", name: "Danny") }

  describe "#initialize" do
    it "sets a type" do
      expect(subject.type).to eq("sweet")
    end

    it "sets a quantity" do
      expect(subject.quantity).to eq(15)
    end

    it "starts ingredients as an empty array" do
      expect(subject.ingredients).to be_empty
    end

    it "raises an argument error when given a non-integer quantity" do
      expect { Dessert.new("sweet", "15", chef) }.to raise_error(ArgumentError)
    end
  end

  describe "#add_ingredient" do
    it "adds an ingredient to the ingredients array" do
      subject.add_ingredient("onion")
      expect(subject.ingredients).to include("onion")
    end
  end

  describe "#mix!" do
    before(:each) do
      subject.add_ingredient("onion")
      subject.add_ingredient("beet")
      subject.add_ingredient("salt")
      subject.add_ingredient("egg")
    end

    it "shuffles the ingredient array" do
      expect(subject.mix!).to_not eq(["onion", "beet", "salt", "egg"])
    end
  end

  describe "#eat" do
    it "subtracts an amount from the quantity" do
      expect(subject.eat(10)).to eq(5)
    end

    it "raises an error if the amount is greater than the quantity" do
      expect { subject.eat(16) }.to raise_error("not enough left!")
    end
  end

  describe "#serve" do
    it "contains the titleized version of the chef's name" do
      allow(chef).to receive(:titleize).and_return("Chef Danny the Great Baker")
      expect(subject.serve).to eq("Chef Danny the Great Baker has made 15 sweets!")
    end
  end

  describe "#make_more" do
    it "calls bake on the dessert's chef with the dessert passed in" do
      expect(chef).to receive(:bake).with(subject)
      subject.make_more
    end
  end
end
