require 'navigation_helper.rb'
include PostsHelper
include Private::ConversationsHelper
include Private::MessagesHelper

module ApplicationHelper
  include NavigationHelper
end
