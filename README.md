Docker files to run a Full-stack MQTT messaging cluster. It combines the power of:
* Haproxy for load balancing
* A MQTT Broker (mosca) x 3 for two way MQTT messaging support
* RabbitMQ x 3 for powerful message publish and subscription
* Custom built MQTT Collector
* MongoDB

To create an easy-to-use cluster capable of handling the volume of messages for typical IoT services. All images have been pushlished on docker hub for your convenience.

# Running

To run the cluster on one machine use [docker-compose](https://github.com/docker/compose/), simply:

```
docker-compose up -d
```

By default 3 RabbitMQ nodes are started up. If needed, additional nodes can be added to [this file](docker-compose.yml).

Broker will wait for rabbit1 to start before starting itself by continuously checking port 5762

Once cluster is up, you can connect to RabbitMQ, Mosca and Haproxy
## RabbitMQ ports
* The management console can be accessed at `http://hostip:15672`
* The management API can be accessed at `http://hostip:15672/api`
* The connection host should look like this: `hostip:5672,hostip:5673,hostip:5674`

## Mosca ports
* Mosca containers can be accessed via port `1883,1884,1885`
* These containers are connected to rabbitMQ 1,2,3 respectively

## Haproxy ports
* Haproxy can be accessed via port `1882`
* Haproxy stats can be accessed via port `8081`

# Rebuild docker image

If you need to change some rabbitMQ config, you can use docker:

```
docker build -t thanhphu/rabbitmq-cluster.
```

# Dependencies
* [mqtt-broker](https://github.com/thanhphu/mqtt-broker)
* [mqtt-collector](https://github.com/thanhphu/mqtt-collector)
* [mqtt-haproxy](https://github.com/thanhphu/mqtt-haproxy)

# Branches (flavors)
* **master**
* **kafka**
* **redis**
* **nomq**
* **rabbitmq-mqtt**

# Credits

* Inspired by https://github.com/bijukunjummen/docker-rabbitmq-cluster
* Forked from https://github.com/harbur/rabbitmq-cluster
* Contains the work of Lelylan
