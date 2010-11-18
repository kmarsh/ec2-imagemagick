# Helpful commands

> sudo rabbitmqctl list_queues
> sudo rabbitmqctl list_queues name durable messages_ready messages_unacknowledged messages_uncommitted messages acks_uncommitted consumers
> while true; do sudo rabbitmqctl list_queues name durable messages_ready messages_unacknowledged messages_uncommitted messages acks_uncommitted consumers; sleep 1; done