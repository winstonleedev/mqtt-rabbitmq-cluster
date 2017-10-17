Docker files to run a Full-stack MQTT messaging cluster. It combines the power of:
* Haproxy for load balancing
* A MQTT Broker (mosca) x 3 for two way MQTT messaging support
* RabbitMQ x 3 for powerful message publish and subscription
* Custom built MQTT Collector
* MongoDB

To create an easy-to-use cluster capable of handling the volume of messages for typical IoT services.

# Running

To run the cluster on one machine use [docker-compose](https://github.com/docker/compose/)

```
docker-compose up -d
```

By default 3 nodes are started up. If needed, additional nodes can be added to this file.

Broker will wait for rabbit1 to start before starting itself by continuously checking port 5762

```
command: bash -c "while ! curl -s rabbit1:5672 > /dev/null; do echo waiting for rabbit1; sleep 3; done; nf start"
```

Once cluster is up:

Subscribe with
```
mosquitto_sub -p 1882 -t 'thanhphu/topic' -d
```
Send messages with
```
mosquitto_pub -p 1882 -t 'thanhphu/topic' -m 'my message'
```

## RabbitMQ ports
* The management console can be accessed at `http://hostip:15672`
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
# Credits

* Inspired by https://github.com/bijukunjummen/docker-rabbitmq-cluster
* Forked from https://github.com/harbur/rabbitmq-cluster
* Contains the work of Lelylan
* Uses Mosca and Mongo DB
