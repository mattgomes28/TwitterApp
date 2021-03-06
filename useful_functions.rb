require 'sqlite3'
require 'date'

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


# This method will turn a date
# string returned from the db
# into a DateTime object
def date_string_to_readable(db_date)

  # Parse string (db date) to DateTime
  date = date_string_to_object(db_date)

  # Format it to a more readable string
  string = "#{date.day}/#{date.month}/#{date.year}"
  string << " #{date.hour}:#{date.minute}"

  return string
end


# This method simply turns
# a database timestamp into
# a Datetime ruby object
def date_string_to_object(db_date)

  # Current time to get the proper zone
  now = DateTime.now

  # Get raw DateTime object
  raw_date = DateTime.strptime(db_date, '%Y-%m-%d %H:%M:%S')

  # Get all info needed for the new obj
  year = raw_date.year
  month = raw_date.month
  day = raw_date.day
  hour = raw_date.hour
  min = raw_date.minute
  sec = raw_date.second
  zone = now.zone

  # Return the processed date
  date = DateTime.new(year, month, day, hour, min, sec, zone)
  return date
end