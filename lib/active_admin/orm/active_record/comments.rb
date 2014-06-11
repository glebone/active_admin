require 'active_admin/orm/active_record/comments/views'
require 'active_admin/orm/active_record/comments/show_page_helper'
require 'active_admin/orm/active_record/comments/namespace_helper'
require 'active_admin/orm/active_record/comments/resource_helper'

# Add the comments configuration
ActiveAdmin::Application.inheritable_setting :allow_comments,             true
ActiveAdmin::Application.inheritable_setting :show_comments_in_menu,      true
ActiveAdmin::Application.inheritable_setting :comments_registration_name, 'Comment'

# Insert helper modules
ActiveAdmin::Namespace.send :include, ActiveAdmin::Comments::NamespaceHelper
ActiveAdmin::Resource.send  :include, ActiveAdmin::Comments::ResourceHelper

# Add the module to the show page
ActiveAdmin.application.view_factory.show_page.send :include, ActiveAdmin::Comments::ShowPageHelper

# Load the model as soon as it's referenced. By that point, Rails & Kaminari will be ready
module ActiveAdmin
  autoload :Comment, 'active_admin/orm/active_record/comments/comment'
end

# Walk through all the loaded namespaces after they're loaded
end
