/**
 * I am a new handler
 * Implicit Functions: preHandler, postHandler, aroundHandler, onMissingAction, onError, onInvalidHTTPMethod
 */
component extends="coldbox.system.EventHandler"{

	this.prehandler_only 	= "";
	this.prehandler_except 	= "";
	this.posthandler_only 	= "";
	this.posthandler_except = "";
	this.aroundHandler_only = "";
	this.aroundHandler_except = "";
	this.allowedMethods = {};

	/**
	 * someAction
	 */
	function index(event, rc, prc) {
        // This will load views/chat.cfm
        event.setView("dashboard/chat");
    }

    function sendMessage(event, rc, prc) {
        // Example logic for broadcasting a chat message
        var message = rc.message ?: "";
        var username = session.userName ?: "Guest";

        // Broadcast message using SocketBox
        if (message.len()) {
            wirebox.getInstance("SocketBox@cbwebsocket").broadcast(
                channel = "chatroom",
                message = {
                    user = username,
                    text = message,
                    time = dateTimeFormat(now(), "hh:mm:ss tt")
                }
            );
        }

        // Return JSON response
        event.renderData(type="json", data={status="ok"});
    }


}

