# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_Depot_session',
  :secret      => 'ec0499cb01a4c607a523263d8aaf0148add2a5aa1834a100acac684dfb833c29175b611930db0c5e13a4d4e5efde62e8b1265f3adc2e7db909906d2b3b10f4e6'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
  ActionController::Base.session_store = :active_record_store
