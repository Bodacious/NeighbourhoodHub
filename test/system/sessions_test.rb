require "application_system_test_case"

class SessionsTest < ApplicationSystemTestCase
  test "user can fill sign in successfully" do
    create(:identification_user, email: "foo@example.com", password: "password")

    visit new_session_path

    fill_in "Email", with: "foo@example.com"
    fill_in "Password", with: "password"
    click_button "Sign in"

    assert_text "Signed in"
    assert_current_path dashboard_path
  end

  test "sign in shows error and stays on the sign-in page when details not recognised" do
    Identification.stubs(authenticate_user: nil)
      visit new_session_path

      fill_in "Email", with: "nope@example.com"
      fill_in "Password", with: "wrong"
      click_button "Sign in"

      assert_current_path "/session"
      assert_text "Details not recognised"
  end
end
