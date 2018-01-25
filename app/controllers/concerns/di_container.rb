require 'active_support/concern'
require 'dependency_injection/container'
require 'dependency_injection/loaders/yaml'

module DiContainer
  extend ActiveSupport::Concern

  def get_di_container
    initialize_di_container if @di_container.nil?
    @di_container
  end

  def initialize_di_container
    @di_container = DependencyInjection::Container.new

    loader = DependencyInjection::Loaders::Yaml.new(@di_container)
    loader.load(Rails.root.join("config", 'services.yml'))
  end
end

