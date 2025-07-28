<style>
    .chat-container {
        height: 90vh;
    }

    .chat-messages {
        height: calc(100% - 120px);
        overflow-y: auto;
        padding: 15px;
        background: #f8f9fa;
        border-radius: 0.5rem;
    }

    .chat-bubble {
        background: #e2f0ff;
        padding: 10px 15px;
        border-radius: 20px;
        margin-bottom: 10px;
        max-width: 75%;
        display: inline-block;
    }

    .chat-bubble.sent {
        background: #d1e7dd;
        align-self: flex-end;
        text-align: right;
    }
</style>


<cfoutput>

    <div class="container py-4">
        <div class="row chat-container shadow rounded-4 overflow-hidden">

            <!-- Optional Sidebar -->
            <div class="col-md-3 border-end d-none d-md-block bg-light">
                <div class="p-3">
                    <h5>Users</h5>
                    <ul class="list-group" id="userList">
                        <!-- Dynamic list of users -->
                        <li class="list-group-item">John</li>
                        <li class="list-group-item">Alice</li>
                    </ul>
                </div>
            </div>

            <!-- Chat Area -->
            <!--- also add is chat is not selected then show simillar like "click on chat to talk" --->
            <div class="col-md-9 d-flex flex-column">
                <div class="bg-primary text-white p-3">
                    <h5 class="mb-0"><i class="fa-solid fa-comments me-2"></i>Chat Room</h5>
                </div>

                <!-- Messages -->
                <div class="chat-messages flex-grow-1 d-flex flex-column" id="chatBox">
                    <!-- Messages will be appended here -->
                </div>

                <!-- Input -->
                <div class="p-3 bg-white chat-input">
                    <div class="input-group">
                        <input type="text" id="msgInput" class="form-control" placeholder="Type a message..." />
                        <button class="btn btn-primary" onclick="sendMessage()">
                            <i class="fa-solid fa-paper-plane"></i> Send
                        </button>
                    </div>
                </div>
            </div>
        </div>
    </div>




    <script src="/socketbox/socketbox-client.js">
        const socket = new SocketBox("ws://localhost:8080"); // adjust as needed
        const channel = "chatroom";

        socket.subscribe(channel);

        socket.onMessage(channel, function (data) {
            const bubble = document.createElement("div");
            bubble.className = "chat-bubble";
            bubble.innerHTML = `<strong>${data.user}</strong>: ${data.text}<br><small class="text-muted">${data.time}</small>`;
            document.getElementById("chatBox").appendChild(bubble);
            scrollToBottom();
        });

        function sendMessage() {
            const input = document.getElementById("msgInput");
            const message = input.value.trim();
            if (message) {
                socket.send(channel, { message });
                input.value = "";
            }
        }

        function scrollToBottom() {
            const chatBox = document.getElementById("chatBox");
            chatBox.scrollTop = chatBox.scrollHeight;
        }
    </script>


</cfoutput>