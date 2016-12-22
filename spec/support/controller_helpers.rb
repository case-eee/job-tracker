module UserHelper
  def authenticate_user
    user = create(:user)
    page.set_rack_session(user_id: user.id)
  end
end
