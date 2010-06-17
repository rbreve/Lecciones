# Be sure to restart your server when you modify this file

# Specifies gem version of Rails to use when vendor/rails is not present
RAILS_GEM_VERSION = '2.3.5' unless defined? RAILS_GEM_VERSION

# Bootstrap the Rails environment, frameworks, and default configuration
require File.join(File.dirname(__FILE__), 'boot')

Rails::Initializer.run do |config|
  config.gem 'warden', :version => '0.10.7'
  config.gem 'devise', :version => '1.0.7'
  config.gem 'formtastic', :lib => 'formtastic', :source => "http://gemcutter.org/"
   
  config.time_zone = 'UTC'
  config.i18n.default_locale = :es
end
