class UserHelpController < ApplicationController
  skip_before_filter :verify_authenticity_token 
  def new_ticket
  end

  def new_customer
  end

  def chat
    ticket = UserHelp.find(params[:ticket])
    customer = Customer.find(params[:customer])
    if ticket.conversations.count == 0
    conversation = Conversation.create(user_id: ticket.user.id, customer_id: customer.id, open_conversation: false, user_help_id:  ticket.id )
    else
    conversation = ticket.conversations.last
    end
    @open_conversation = conversation

    render layout: 'public_chat'
  end

end
