class UserSerializer
  def initialize(user)
    @user = user
  end

  def as_json
    {
      'user' => {
        'id' => @user.id,
        'first_name' => @user.first_name,
        'last_name' => @user.last_name,
        'email' => @user.email
      }
    }
  end
end
