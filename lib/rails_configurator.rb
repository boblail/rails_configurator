require "rails_configurator/version"
require "ostruct"


module RailsConfigurator
  
  
  
  def RailsConfigurator.extend(config, property, options={}, &block)
    config.class.class_eval do
      
      define_method(property) do
        ivar = "@#{property}"
        instance_variable_get(ivar) || instance_variable_set(ivar, (begin
          
          defaults = options[:defaults] || {}
          settings_path = options[:path] || Rails.root.join("config", "#{property}.yml")
          settings = YAML.load_file(settings_path)[Rails.env.to_s]
          settings.reverse_merge!(defaults)
          
          o = OpenStruct.new(settings)
          o.class_eval(&block) if block_given?
          o
        end))
      end
      
    end
  end
  
  
  
  module InstanceMethods
    
    def extend(property, options={}, &block)
      RailsConfigurator.extend(self, property, options, &block)
    end
    
  end
  
  
  
end



Rails::Application::Configuration.send(:include, RailsConfigurator::InstanceMethods)
