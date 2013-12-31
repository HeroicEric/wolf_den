module Authentication
  def sign_in_as(user)
    visit user_session_path
    fill_in 'Email', with: 'jmoon90@aol.com'
    fill_in 'Password', with: 'applepie'
    click_button 'Sign in'
  end
end
