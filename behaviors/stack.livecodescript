﻿script "APNsAssistant Stack Behavior"
on preOpenStack
   # catch it so that we don't re-send the event to the main stack, which would cause it to try to repopulate the datagrid
   startUsingLibraryStacks
end preOpenStack



on libraryStack
	startUsingLibraryStacks
end libraryStack



on startUsingLibraryStacks #put the pushSend and pushFeedback stacks in the message path
	put the folder into oldFolder
	put stackPath()&"libraries/" into thePath
	set the folder to thePath
	start using stack "pushSend.livecodescript" #for sending messages
	start using stack "pushFeedback.livecodescript" #for retrieving feedback
	set the folder to oldFolder
end startUsingLibraryStacks



on openStack
   # catch it so we don't re-send the event to the main stack
end openStack



on closeStack
   #catch it so we don't re-send it to the main stack
end closeStack



function stackPath
	put the long name of this stack into goop
	set the itemDelimiter to slash
	delete last item of goop
	put slash after goop
	delete char 1 to 7 of goop # stack "
	return goop
end stackPath	
