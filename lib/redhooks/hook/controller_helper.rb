module Redhooks
  module Hook
    # Helper module included in ActionControllers so that
    # hooks can be called in controllers like:
    #   call_hook(:some_hook)
    #   call_hook(:another_hook, :foo => 'bar'
    # 
    # Hooks added to controllers will return an array of results.
    #
    # Objects automatically added to the call context:
    # 
    # * request => Request instance
    # * controller => current Controller instance
    # 
    module ControllerHelper
      def call_hook(hook, context={})
        default_context = {:controller => self, :request => request}
        Redhooks::Hook.call_hook(hook, default_context.merge(context))
      end
    end
  end
end

::ActionController::Base.send(:include, Redhooks::Hook::ControllerHelper)
