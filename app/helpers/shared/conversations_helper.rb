module Shared::ConversationsHelper

  def private_conv_seen_status(conversation) 
    # if the latest message of a conversation is not created by a current_user
    # and it is unseen, return an unseen-conv value
    not_created_by_user = conversation.messages.last.user_id != current_user.id
    unseen = conversation.messages.last.seen == false
    not_created_by_user && unseen ? 'unseen-conv' : ''
  end

  # decide to show an option or not
  def add_to_contacts_partial_path(contact)
    if recipient_is_contact? 
      'shared/empty_partial'
    else 
      non_contact(contact)
    end 
  end

  # decide which conversation heading style to show
  def conv_heading_class(contact)
    # show a conversation heading without or with options
    if unaccepted_contact_exists(contact)
    'conversation-heading-full'
    else
    'conversation-heading'
    end
  end

  def get_contact_record(recipient)
    contact = Contact.find_by_users(current_user.id, recipient.id)
  end
  
  # show an unaccepted contact request's status if any
  def unaccepted_contact_request_partial_path(contact)
    if unaccepted_contact_exists(contact) 
      if request_sent_by_user(contact)
        "private/conversations/conversation/request_status/sent_by_current_user"  
      else
        "private/conversations/conversation/request_status/sent_by_recipient" 
      end
    else
      'shared/empty_partial'
    end
  end

  # show a link to send a contact request
  # if an opposite user is not in contacts and no requests exist
  def not_contact_no_request_partial_path(contact)
    if recipient_is_contact? == false && unaccepted_contact_exists(contact) == false
      "private/conversations/conversation/request_status/send_request"
    else
      'shared/empty_partial'
    end
  end

  private

  def request_sent_by_user(contact)
    # true if contact request was sent by the current_user 
    # false if it was sent by a recipient
    contact['user_id'] == current_user.id
  end

  private

  def recipient_is_contact?
    # check if recipient is a user's contact
    contacts = current_user.all_active_contacts
    contacts.find {|contact| contact['id'] == @recipient.id}.present?
  end

  def non_contact(contact)
    # if the contact request was sent by the user or recipient 
    if unaccepted_contact_exists(contact)
      'shared/empty_partial'
    else 
      # contact requests wasn't sent by any users 
      'private/conversations/conversation/heading/add_user_to_contacts' 
    end
  end

  def unaccepted_contact_exists(contact)
    # get a contact status with the recipient
    if contact.present?
      # check if an unaccepted contact between a user and a recipient exists
      contact.accepted ? false : true
    else
      false
    end
  end
end