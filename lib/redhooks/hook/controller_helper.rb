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
