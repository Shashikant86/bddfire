Dir[File.dirname(__FILE__) + '/bddfire/*.rb'].each {|file| require file }
require 'require_all'

# load all ruby files in the directory "lib" and its subdirectories
require_all 'lib'

module BDDfire


end
