require "spec_helper"

describe UsersController do
  it "should signup new users" do
    visit '/'
    click_on 'Register'
    fill_in :user_name, with: 'testuser'
    fill_in :user_email, with: 'testemail@domain.com'
    fill_in :user_password, with: 'password'
    fill_in :user_password_confirmation, with: 'password'
    click_on 'Create my account'

    expect(page).to have_content("Welcome to the Mana!")

    fill_in :team_name, with: 'testteam'
    click_on 'Create team'

    expect(page).to have_content("Team Created!")
    expect(page).to have_content("testuser")
  end

  it "should edit profile" do
    login
    visit '/'
    click_on 'Profile'
    click_on 'Edit Profile'

    fill_in :user_profile_first_name, with: 'my first name'
    fill_in :user_profile_last_name, with: 'my last name'
    fill_in :user_profile_job_title, with: 'my job title'
    fill_in :user_profile_phone, with: '123123'
    click_on 'Update User profile'
  end
end
