App.room = App.cable.subscriptions.create "RoomChannel",
  connected: ->
    console.log('CONNECTED')
    # Called when the subscription is ready for use on the server

  disconnected: ->
    console.log('DISCONNECTED')
    # Called when the subscription has been terminated by the server

  received: (data) ->
    console.log('RECEIVED', data)
    #$('#messages').append data['message']
    new Notification data["title"], message: data["message"]

  speak: (message) ->
    @perform 'speak', message: message

$(document).on 'keypress', '[data-behavior~=room_speaker]', (event) ->
  if event.keyCode is 13 #return = send
    App.room.speak event.target.value
    event.target.value = ''
    event.preventDefault()
