require 'navigation_helper.rb'
include PostsHelper
include Private::ConversationsHelper
include Private::MessagesHelper
include Group::ConversationsHelper

module ApplicationHelper
  include NavigationHelper
end
