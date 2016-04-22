def token_sign_in(user)
  auth_headers = user.create_new_auth_token
  request.headers.merge!(auth_headers)
end

def test_sign_in(user, headers)
  auth_headers = user.create_new_auth_token
  headers.merge!(auth_headers)
  print headers
end
