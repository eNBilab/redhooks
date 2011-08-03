module Redhooks
  module Hook
    # Helper module included in ApplicationHelper so that
    # hooks can be called in views like this:
    # 
    #   <%= call_hook(:some_hook) %>
    #   <%= call_hook(:another_hook, :foo => 'bar' %>
    # 
    # Hooks added to views will be concatenated into a string.
    #
    # Objects automatically added to the call context:
    # 
    # * request => Request instance
    # * controller => current Controller instance
    # 
    module ViewHelper
      def call_hook(hook, context={})
        default_context = {:controller => controller, :request => request}
        Redhooks::Hook.call_hook(hook, default_context.merge(context)).join(' ')
      end
    end
  end
end

module ApplicationHelper
  include Redhooks::Hook::ViewHelper
end
