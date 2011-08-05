# Redmine - project management software
# Copyright (C) 2006-2008  Jean-Philippe Lang
#
# This program is free software; you can redistribute it and/or
# modify it under the terms of the GNU General Public License
# as published by the Free Software Foundation; either version 2
# of the License, or (at your option) any later version.
# 
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
# 
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA.

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
