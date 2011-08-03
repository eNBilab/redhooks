module Redhooks
  module Hook
    # Listener class used for views hooks.
    # Listeners that inherit this class will include various helpers by default.
    # 
    class ViewListener < Listener
      include ERB::Util
      include ActionView::Helpers::TagHelper
      include ActionView::Helpers::FormHelper
      include ActionView::Helpers::FormTagHelper
      include ActionView::Helpers::FormOptionsHelper
      include ActionView::Helpers::JavaScriptHelper
      include ActionView::Helpers::PrototypeHelper
      include ActionView::Helpers::NumberHelper
      include ActionView::Helpers::UrlHelper
      include ActionView::Helpers::AssetTagHelper
      include ActionView::Helpers::TextHelper
      
      def self.inherited(child)
        child.send(:include, ApplicationHelper)
      end

      # Helper method to directly render a partial using the context:
      # 
      #   class MyHook < Redhooks::Hook::ViewListener
      #     render_on :view_issues_show_details_bottom, :partial => "show_more_data" 
      #   end
      #
      def self.render_on(hook, options={})
        define_method hook do |context|
          context[:controller].send(:render_to_string, {:locals => context}.merge(options))
        end
      end
    end
  end
end
