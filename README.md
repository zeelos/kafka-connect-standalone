# kafka-connect-standalone

An extension to the original Confluent [kafka-connect docker image](https://github.com/confluentinc/cp-docker-images/tree/3.3.x/debian/kafka-connect-base) that invokes a "standalone" worker instead.

An example usage in a `docker-compose.yml` file can be like the following. Similar to the default `CONNECT_` prefix, the `STANDALONE_` prefix is used to fill a worker's standalone properties file.  

      kafka-connect-standalone:
        image: kafka-connect-standalone:latest
        deploy:
          replicas: 1
        environment:
          - CONNECT_BOOTSTRAP_SERVERS=kafka:9092
          - CONNECT_KEY_CONVERTER=org.apache.kafka.connect.json.JsonConverter
          - CONNECT_VALUE_CONVERTER=org.apache.kafka.connect.json.JsonConverter
          - CONNECT_INTERNAL_KEY_CONVERTER=org.apache.kafka.connect.json.JsonConverter
          - CONNECT_INTERNAL_VALUE_CONVERTER=org.apache.kafka.connect.json.JsonConverter
          - CONNECT_OFFSET_STORAGE_FILE_FILENAME=/tmp/connect.offsets
          - CONNECT_OFFSET_FLUSH_INTERVAL_MS=10000
          - STANDALONE_NAME=local-file-source
          - STANDALONE_CONNECTOR_CLASS=org.apache.kafka.connect.file.FileStreamSourceConnector
          - STANDALONE_TASKS_MAX=1
          - STANDALONE_FILE=test.txt
          - STANDALONE_TOPIC=connect-test
        networks:
          - mynet
        ports:
          - 8083:8083
        ...