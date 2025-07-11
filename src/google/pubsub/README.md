# Basic setup

This contains a terraform template that contains services required to create a pubsub on google cloud with the following components:

1. A topic
2. A subscription for both pull or push type subscription
3. A dead letter topic to receive failed messages from the subscription
4. A subscription to receive messages from the dead letter topic
