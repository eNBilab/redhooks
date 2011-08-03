module Redhooks
  module Hook
    # Base class for hook listeners.
    class Listener
      include Singleton

      # Registers the listener
      def self.inherited(child)
        Redhooks::Hook.add_listener(child)
        super
      end

    end
  end
end
