require "rails_helper"


describe "Product Attribute Requirements on Create", :type => :model do
  context "validation tests" do
    it "ensures the title is present when creating product" do
      product = Product.new(description: "Content of the description", qty: 0)
      expect(product.valid?).to eq(false)
    end
    it "should not be able to save product when title missing" do
        product = Product.new(description: "Some description content goes here", qty: 0)
      expect(product.save).to eq(false)
    end
    it "should be able to save product when have description and title" do
      product = Product.new(title: "Title", description: "Content of the description", qty: 0)
      expect(product.save).to eq(true)
    end

    it "ensures the description is present when creating product" do
        product = Product.new(title: "title", qty: 0)
        expect(product.valid?).to eq(false)
        end
    it "should not be able to save product when description missing" do
        product = Product.new(title: "title", qty: 0)
        expect(product.save).to eq(false)
    end
  end
end


describe "Product Attribute Requirements on Edit", :type => :model do
  context "Edit product" do  
    before (:each) do
      @product = Product.create(title: "Title", description: "Content of the description", qty: 0)
      end
    it "ensures the title is present when editing product" do
      @product.update(:title => "New Title")
      expect(@product.title == "New Title")
    end
    it "ensures the description is present when editing product" do
        @product.update(:description => "New Des")
        expect(@product.description == "New Des")
      end
  end
end

