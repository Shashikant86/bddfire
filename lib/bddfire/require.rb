Dir[File.dirname(__FILE__) + '/web/*.rb'].each { |file| require file }
Dir[File.dirname(__FILE__) + '/mobile/*.rb'].each { |file| require file }
Dir[File.dirname(__FILE__) + '/assertions/*.rb'].each { |file| require file }
Dir[File.dirname(__FILE__) + '/page-objects/*.rb'].each { |file| require file }
Dir[File.dirname(__FILE__) + '/accessibility/*.rb'].each { |file| require file }
Dir[File.dirname(__FILE__) + '/api/*.rb'].each { |file| require file }
