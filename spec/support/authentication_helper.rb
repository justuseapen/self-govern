module Authentication
  def sign_in_as(user)
    visit root_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    user.confirmed_at = DateTime.now
    user.save
    click_on 'Sign in'
  end

  def sign_out
    visit root_path
    click_on 'Logout'
  end
end
