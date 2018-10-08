class RoomsController < ApplicationController
  def show
    ActionCable.server.broadcast "room_channel", { title: 'New things!', message: 'All the news that is fit to print' }
    @messages = Message.all
  end
end
