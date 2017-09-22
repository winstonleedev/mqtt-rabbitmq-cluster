Docker images to run MQTT broker + RabbitMQ + Collector + MongoDB cluster. 

# Building

Once you clone the project locally docker to build rabbitmq:

```
docker build -t harbur/rabbitmq-cluster.
```

# Running with docker-compose

If you want to run the cluster on one machine use [docker-compose](https://github.com/docker/compose/)

```
docker-compose up -d
```

By default 3 nodes are started up. If needed, additional nodes can be added to this file.
Broker will wait for rabbit1 to start before starting itself by continuously checking port 5762

```
command: bash -c "while ! curl -s rabbit1:5672 > /dev/null; do echo waiting for rabbit1; sleep 3; done; nf start"
```

Once cluster is up:
* The management console can be accessed at `http://hostip:15672`
* The connection host should look like this: `hostip:5672,hostip:5673,hostip:5674`

# Credits

* Inspired by https://github.com/bijukunjummen/docker-rabbitmq-cluster
* Forked from https://github.com/harbur/rabbitmq-cluster