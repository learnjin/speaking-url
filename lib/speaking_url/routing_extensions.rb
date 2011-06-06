
module ActionDispatch::Routing

  class Mapper

    def speaking_url_resource(*resources)

      resources.map!(&:to_sym)

      resources.each do |sym|

        klass = Kernel.const_get(sym.to_s.classify) 

        current_address_constraint_class = Class.new do
          @klass = klass
          class << self; attr_reader :klass; end
          def matches?(request)
            r = self.class.klass.find_by_url(request.path)
            return false if r.nil?
            r.current_url == request.path
          end
        end

        old_address_constraint_class = Class.new do
          @klass = klass
          class << self; attr_reader :klass; end
          def matches?(request)
            r = self.class.klass.find_by_url(request.path)
            return false if r.nil?
            r.current_url != request.path
          end
        end

        match "*path", :to  => "#{klass.name.underscore.pluralize}#show", :constraints => current_address_constraint_class.new
        match "*path" => redirect{|p, req| klass.find_by_url(req.path).current_url}, :constraints => old_address_constraint_class.new

      end
    end
  end

end


