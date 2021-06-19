
import consumer from "./consumer"

document.addEventListener('turbolinks:load', () => {

  const user_id = document.getElementById("user_id").value;

  consumer.subscriptions.create({channel: "MessageNotificationChannel",user_id:user_id}, {
    connected() {
      // Called when the subscription is ready for use on the server
      console.log("Message Notification Connected to channel !!!"+ user_id);
    },

    disconnected() {
      // Called when the subscription has been terminated by the server
    },

    received(data) {
      // Called when there's incoming data on the websocket for this channel
      const message_notification_number= Number(document.getElementById("message_notification_number").innerHTML);
      console.log(message_notification_number)
      document.getElementById("message_notification_number").innerHTML = String(message_notification_number+1)
      let old_html = document.getElementById("message_notification").innerHTML
      let new_html = data.html + old_html
      document.getElementById("message_notification").innerHTML = new_html
      console.log( data.html);

    }
  });
});