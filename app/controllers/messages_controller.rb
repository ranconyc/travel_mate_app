class MessagesController < ApplicationController
  def create
    @activity = Activity.find(params[:activity_id])
    @message = Message.new(message_params)
    @message.user = current_user
    @message.activity = @activity
    if @message.save
      ActivityChannel.broadcast_to(
        @activity,
        render_to_string(partial: "message", locals: { message: @message })
      )
      redirect_to chat_path(@activity, anchor: "message-#{@message.id}")
    else
      render 'chats#show'
    end
  end

  private

  def message_params
    params.require(:message).permit(:content)
  end
end
