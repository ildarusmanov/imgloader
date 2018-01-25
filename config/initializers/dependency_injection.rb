require 'dependency_injection/container'
require 'dependency_injection/loaders/yaml'

container = DependencyInjection::Container.new
loader = DependencyInjection::Loaders::Yaml.new(container)
loader.load(Rails.root.join("config", 'services.yml'))

