# Go to http://wiki.merbivore.com/pages/init-rb
 
# Specify a specific version of a dependency
# dependency "RedCloth", "> 3.0"
dependency 'laurynasl-hornsby'
dependency "merb-helpers"
dependency "merb-mailer"
dependency "merb-slices"
dependency "merb-auth-core"
dependency "merb-auth-more"
dependency "merb-auth-slice-password"
dependency "merb-param-protection"
dependency "merb-exceptions"


require 'lib/sequel-ext/timestamps'
require 'lib/nil'
require 'lib/dec'
require 'lib/invoke'
require 'lib/date'
require 'lib/time'
require 'lib/string'

use_orm :sequel
use_test :rspec
use_template_engine :erb
 
Merb::Config.use do |c|
  c[:use_mutex] = false
  c[:session_store] = 'cookie'  # can also be 'memory', 'memcache', 'container', 'datamapper
  
  # cookie session store configuration
  c[:session_secret_key]  = 'bfb6319a88b66e5a30e7e3c15f1c6a065c7306ca'  # required for cookie session store
  c[:session_id_key] = '_forestofevil_session_id' # cookie session id key, defaults to "_session_id"
end
 
Merb::BootLoader.before_app_loads do
  # This will get executed after dependencies have been loaded but before your app's classes have loaded.
  require 'sequel/extensions/inflector'
  require 'sequel/extensions/pagination'
  Sequel::Model.plugin :validation_class_methods
  Sequel::Model.plugin :hook_class_methods
end
 
Merb::BootLoader.after_app_loads do
  # This will get executed after your app's classes have been loaded.
end
