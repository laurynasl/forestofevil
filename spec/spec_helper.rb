require "rubygems"
require 'merb-core'
require 'spec' # Satisfies Autotest and anyone else not using the Rake tasks

# Add the local gems dir if found within the app root; any dependencies loaded
# hereafter will try to load from the local gems before loading system gems.
if (local_gem_dir = File.join(File.dirname(__FILE__), '..', 'gems')) && $BUNDLE.nil?
  $BUNDLE = true; Gem.clear_paths; Gem.path.unshift(local_gem_dir)
end

require "merb-core"
require "spec" # Satisfies Autotest and anyone else not using the Rake tasks

# this loads all plugins required in your init file so don't add them
# here again, Merb will do it for you
Merb.start_environment(:testing => true, :adapter => 'runner', :environment => ENV['MERB_ENV'] || 'test')

Hornsby.load

Spec::Runner.configure do |config|
  #config.include(Merb::Test::ViewHelper)
  config.include(Merb::Test::RouteHelper)
  config.include(Merb::Test::ControllerHelper)
  config.include(HornsbySpecHelper)
end

require 'rspec_merb_helpers'
include RSpecMerbHelpers

def authenticated_request(login, method, url, parameters, &block)
  response = send(method, url, parameters) do |c|
    user = User.first(:login => login) || raise('user not found')
    c.session.stub!(:user).and_return(user)
    #c.session.user = user.id
    c.stub!(:ensure_authenticated).and_return(true) 
    block.call(c) if block
  end
  response
end

create_authenticated_requests [['laurynas', 'kudlius'], ['fiodor', 'fiodor'], ['root', 'root']]
