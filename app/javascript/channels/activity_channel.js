import consumer from "./consumer"

const initActivityCable = () => {
  const messagesContainer = document.getElementById('messages');
  if (messagesContainer) {
    const id = messagesContainer.dataset.activityId;

    consumer.subscriptions.create({ channel: "ActivityChannel", id: id }, {
      received(data) {
        messagesContainer.insertAdjacentHTML('beforeend', data);
      },
    });
  }
}

export { initActivityCable };
