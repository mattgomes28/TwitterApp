require 'sqlite3'

# Check if the username given is a
# valid username.
def is_valid_username(db, username)

  # if value is returned then username is not valid
  if db.execute('SELECT 1 FROM users WHERE username=?', username).length > 0 then
    return false
  else
    return true
  end

end

# Check if the email is already
# registered on the system by
# doing a simple query to return
# records with an email.
def is_email_taken(db, email)

  # Return true if email is on database
  if db.execute('SELECT 1 FROM users WHERE email=?', email).length  > 0 then
    return true
  else
    return false
  end
end


# Check if the twitter name
# is already registered in the
# system. Return true if it is,
# false if it's not.
def is_twitter_taken(db, twitter)

  # Return true if twitter is on database
  if db.execute('SELECT 1 FROM users WHERE twitter=?', twitter).length  > 0 then
    return true
  else
    return false
  end
end
