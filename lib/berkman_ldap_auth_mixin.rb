module BerkmanLdapAuthMixin
  def authenticate(username,password)
#    auth_class = BerkmanLdapAuth
#    if ENV['RAILS_ENV'] != 'production'
      auth_class = BerkmanDummyAuth
#    end
    if auth_class.authenticate(username,password)
      # We've auth'd. Autocreate the user if they don't exist.
      u = self.find_by_username(username)
      if u.blank?
        user = User.create(:username => username)
        return user
      else
        return u
      end
    end
    #No auth! return nil.
    return nil
  end
end
