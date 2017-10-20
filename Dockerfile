FROM rabbitmq:3.5.3-management
LABEL maintainer "Thanh Phu"

COPY rabbitmq-cluster /usr/local/bin/
COPY pre-entrypoint.sh /

RUN rabbitmq-plugins enable --offline rabbitmq_mqtt

# AMQP PORTS
EXPOSE 5672 15672
# MQTT PORTS
EXPOSE 1883 8883
# EPMD PORTS for discovery https://stackoverflow.com/questions/12792856/what-ports-does-rabbitmq-use
EXPOSE 4369 35197

ENTRYPOINT ["/pre-entrypoint.sh"]
CMD ["rabbitmq-cluster"]
