require 'bddfire/extensions/string'
Dir[File.dirname(__FILE__) + '/bddfire/*.rb'].each {|file| require file }

module BDDfire
  autoload :App,    "bddfire/app"
  autoload :Tasks,  "bddfire/tasks"
end
