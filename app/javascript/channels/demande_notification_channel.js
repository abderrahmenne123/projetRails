import consumer from "./consumer"

// const user_id = document.getElementById("user_id").value;
const user_id = 
consumer.subscriptions.create({channel: "DemandeNotificationChannel",user_id:user_id}, {
  connected() {
    // Called when the subscription is ready for use on the server
    console.log("Demande Notification Connected to channel !!!"+ user_id);
  },
    

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    // Called when there's incoming data on the websocket for this channel
    const notification_number= Number(document.getElementById("notification_number").innerHTML);
      console.log(notification_number)
      document.getElementById("notification_number").innerHTML = String(notification_number+1)
      let old_html = document.getElementById("notification").innerHTML
      let new_html = data.html + old_html
      document.getElementById("notification").innerHTML = new_html
      console.log( data.html);
  }
});
