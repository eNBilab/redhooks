module Redhooks
  require 'redhooks/engine' if defined?(Rails) && Rails::VERSION::MAJOR == 3
  require 'redhooks/hook'
  require 'redhooks/hook/listener'
end
