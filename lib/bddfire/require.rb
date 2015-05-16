Dir["/web/*.rb"].each {|file| require file }
Dir["/mobile/*.rb"].each {|file| require file }
Dir["/page-objects/*.rb"].each {|file| require file }
Dir["/asertions/*.rb"].each {|file| require file }
