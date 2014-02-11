module Authentication
  def sign_in_as(user)
    visit root_path
    click_on 'Login'
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_on 'Sign in'
  end

  def sign_out
    visit root_path
    click_on 'Logout'
  end
end
