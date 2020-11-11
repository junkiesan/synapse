require 'navigation_helper.rb'
include PostsHelper
include Private::ConversationsHelper
include Private::MessagesHelper
include Group::ConversationsHelper
include Group::MessagesHelper

module ApplicationHelper
  include NavigationHelper

  def private_conversations_windows
    params[:controller] != 'messengers' ? @private_conversations_windows : []
  end
  
  def group_conversations_windows
    params[:controller] != 'messengers' ? @group_conversations_windows : []
  end
end
