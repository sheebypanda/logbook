require "application_system_test_case"

class EventsTest < ApplicationSystemTestCase
  setup do
    @event = events(:one)
  end

  test "visiting the index" do
    visit events_url
    assert_selector "h1", text: "Events"
  end

  test "creating a Event" do
    visit events_url
    click_on "New Event"

    fill_in "Category", with: @event.category_id
    fill_in "Date", with: @event.date
    fill_in "Description", with: @event.description
    check "Disable" if @event.disable
    fill_in "Priority", with: @event.priority_id
    check "Recurrent" if @event.recurrent
    fill_in "Si", with: @event.si_id
    fill_in "Subject", with: @event.subject_id
    fill_in "User", with: @event.user_id
    click_on "Create Event"

    assert_text "Event was successfully created"
    click_on "Back"
  end

  test "updating a Event" do
    visit events_url
    click_on "Edit", match: :first

    fill_in "Category", with: @event.category_id
    fill_in "Date", with: @event.date
    fill_in "Description", with: @event.description
    check "Disable" if @event.disable
    fill_in "Priority", with: @event.priority_id
    check "Recurrent" if @event.recurrent
    fill_in "Si", with: @event.si_id
    fill_in "Subject", with: @event.subject_id
    fill_in "User", with: @event.user_id
    click_on "Update Event"

    assert_text "Event was successfully updated"
    click_on "Back"
  end

  test "destroying a Event" do
    visit events_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Event was successfully destroyed"
  end
end
