require "rails_helper"


RSpec.feature "Products", type: :feature do
    context "Update product" do
        let(:product) { Product.create(title: "Test title", description: "Test content", qty: 0) }
        before(:each) do
            visit edit_product_path(product)
        end
 
        describe "when filling in description" do
            scenario "should succeed if filled in" do
                within("form") do
                    fill_in "Description", with: "New description content"
                end
                click_button "Update Product"
                expect(page).to have_content("Product was successfully updated")
            end

            scenario "should fail if empty" do
                within("form") do
                    fill_in "Description", with: ""
                end
                click_button "Update Product"
                expect(page).to have_content("Description can't be blank")
            end
        end
        
        describe "when filling in title" do
            scenario "should succeed if filled in" do
                within("form") do
                    fill_in "Title", with: "New title content"
                end
                click_button "Update Product"
                expect(page).to have_content("Product was successfully updated")
            end

            scenario "should fail if empty" do
                within("form") do
                    fill_in "Title", with: ""
                end
                click_button "Update Product"
                expect(page).to have_content("Title can't be blank")
            end
        end  

        describe "when filling in qty" do
            scenario "should succeed if filled in" do
                within("form") do
                    fill_in "Qty", with: 0
                end
                click_button "Update Product"
                expect(page).to have_content("Product was successfully updated")
            end

            scenario "should fail if empty" do
                within("form") do
                    fill_in "Qty", with: ""
                end
                click_button "Update Product"
                expect(page).to have_content("Qty is not a number")
            end
        end  
    end
end
