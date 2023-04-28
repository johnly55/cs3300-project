require "rails_helper"

RSpec.feature "Products", type: :feature do

    context "Login" do
        scenario "should sign up" do
          visit root_path
          click_link 'Sign up'
          within("form") do
            fill_in "Email", with: "testing@test.com"
            fill_in "Password", with: "123456"
            fill_in "Password confirmation", with: "123456"
            click_button "Sign up"
          end
          expect(page).to have_content("Welcome! You have signed up successfully.")
        end
    
        scenario "should log in" do
          user = FactoryBot.create(:user)
          login_as(user)
          visit root_path
          expect(page).to have_content("Welcome:")
        end
    end
    
    context "Update product" do
        let(:product) { Product.create(title: "Test title", description: "Test content", qty: 0) }
        before(:each) do
            user = FactoryBot.create(:user)
            login_as(user)
            visit edit_product_path(product)
        end
 
        scenario "should succeed if description filled in" do
            fill_in "Description", with: "New description content"
            click_button "Update Product"
            expect(page).to have_content("Product was successfully updated.")
        end

        scenario "should fail if description empty" do
            fill_in "Description", with: ""
            click_button "Update Product"
            expect(page).to have_content("Description can't be blank")
        end
        
        scenario "should succeed if title filled in" do
            fill_in "Title", with: "New title content"
            click_button "Update Product"
            expect(page).to have_content("Product was successfully updated")
        end

        scenario "should fail if title empty" do
            fill_in "Title", with: ""
            click_button "Update Product"
            expect(page).to have_content("Title can't be blank")
        end

        scenario "should succeed if qty filled in" do
            fill_in "Qty", with: 0
            click_button "Update Product"
            expect(page).to have_content("Product was successfully updated")
        end

        scenario "should fail if qty empty" do
            within('form') do
                fill_in "Qty", with: ""
            end
            click_button "Update Product"
            expect(page).to have_content("Qty is not a number")
        end

        scenario "should fail if qty less than 0" do
            within('form') do
                fill_in "Qty", with: -1
            end
            click_button "Update Product"
            expect(page).to have_content("Qty must be greater than or equal to 0")
        end
    end

    context "Create product" do
        let(:product) { Product.create(title: "Test title", description: "Test content", qty: 0) }
        before(:each) do
            user = FactoryBot.create(:user)
            login_as(user)
            visit new_product_path(product)
        end
 
        scenario "should succeed if title, description, qty filled in" do
            fill_in "Title", with: "New title content"
            fill_in "Description", with: product.title
            fill_in "Qty", with: 0
            click_button "Create Product"
            expect(page).to have_content("Product was successfully created.")
        end

        scenario "should fail if description empty" do
            fill_in "Description", with: ""
            click_button "Create Product"
            expect(page).to have_content("Description can't be blank")
        end

        scenario "should fail if title empty" do
            fill_in "Title", with: ""
            click_button "Create Product"
            expect(page).to have_content("Title can't be blank")
        end

        scenario "should fail if qty empty" do
            within('form') do
                fill_in "Qty", with: ""
            end
            click_button "Create Product"
            expect(page).to have_content("Qty is not a number")
        end

        scenario "should fail if qty less than 0" do
            within('form') do
                fill_in "Qty", with: -1
            end
            click_button "Create Product"
            expect(page).to have_content("Qty must be greater than or equal to 0")
        end
    end

    context "Show product" do
        let(:product) { Product.create(title: "Test title", description: "Test content", qty: 0) }
 
        scenario "should show edit if signed in" do
            user = FactoryBot.create(:user)
            login_as(user)
            visit product_path(product)
            expect(page).to have_content("Edit")
        end

        scenario "should not show edit if signed out" do
            visit product_path(product)
            expect(page).to_not have_content("Edit")
        end
    end
end
