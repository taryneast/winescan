# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_winescan_rails_session',
  :secret      => 'c500ee61751fdb0277aa04a2c8277ef6ce4752b67d610ba245f0da3d96a1e1806d33799634c63881fc62fc49a5b1f721beff9dd0c52d104df25a142d194785fb'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
