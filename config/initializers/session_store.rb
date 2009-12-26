# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_volitional-adventures_session',
  :secret      => '4958f2db52d4fe73074ac1603e4ea1bf68b29d4a6c46a02915dce39c397f0d034fd8b61ea5ff240bd51c21ef522a2901ccbb396e67c2f9ef4439d477c654fcbf'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
