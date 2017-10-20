FROM rabbitmq:3.5.3-management
LABEL maintainer "Thanh Phu"

COPY rabbitmq-cluster /usr/local/bin/
COPY pre-entrypoint.sh /

RUN rabbitmq-plugins enable --offline rabbitmq_mqtt

EXPOSE 5672 15672 8883
ENTRYPOINT ["/pre-entrypoint.sh"]
CMD ["rabbitmq-cluster"]
