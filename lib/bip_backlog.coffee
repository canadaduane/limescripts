bind 'privmsg', ( line ) ->
  BIP_TIME = /(\d\d):(\d\d):(\d\d)&gt;/
  line = $(line)
  message = line.find '.message'
  messageBody = $(message).html()
  if BIP_TIME.test messageBody
    timeResults = BIP_TIME.exec( messageBody )
    hours = timeResults[ 1 ]
    minutes = timeResults[ 2 ]
    seconds = timeResults[ 3 ]
    line.find( '.time' ).html $("<span>#{hours}:#{minutes}</span>")
    line.html line.html().replace(BIP_TIME, "")
    line.addClass 'backlog'