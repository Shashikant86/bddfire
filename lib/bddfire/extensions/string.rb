module BDDfire
  module Extensions
    module String
      def camelize
        self.capitalize.gsub(/[ _\-]+([a-z])?/) { $1.upcase }
      end
    end
  end
end

String.send(:include, BDDfire::Extensions::String)