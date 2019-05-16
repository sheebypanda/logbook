require "application_system_test_case"

class SisTest < ApplicationSystemTestCase
  setup do
    @si = sis(:one)
  end

  test "visiting the index" do
    visit sis_url
    assert_selector "h1", text: "Sis"
  end

  test "creating a Si" do
    visit sis_url
    click_on "New Si"

    fill_in "Name", with: @si.name
    fill_in "Trigram", with: @si.trigram
    click_on "Create Si"

    assert_text "Si was successfully created"
    click_on "Back"
  end

  test "updating a Si" do
    visit sis_url
    click_on "Edit", match: :first

    fill_in "Name", with: @si.name
    fill_in "Trigram", with: @si.trigram
    click_on "Update Si"

    assert_text "Si was successfully updated"
    click_on "Back"
  end

  test "destroying a Si" do
    visit sis_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Si was successfully destroyed"
  end
end
