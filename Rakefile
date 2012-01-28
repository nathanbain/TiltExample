require 'active_support/deprecation'
require 'active_support/dependencies'

ActiveSupport::Dependencies.autoload_paths << File.expand_path(File.join(Dir.pwd, 'lib'))

namespace :tilt do
  task :contact_details do |t|
    sh %{ ruby lib/contact_details.rb }
  end
end
