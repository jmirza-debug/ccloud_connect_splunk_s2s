#!/bin/bash
source .env

HEADER="Content-Type: application/json"
DATA=$( cat << EOF
{
  "name": "splunk-s2s-source",
  "config":{
    "connector.class": "io.confluent.connect.splunk.s2s.SplunkS2SSourceConnector",
    "topics": "splunk-s2s-events",
    "splunk.s2s.port":"9997",
    "kafka.topic":"splunk-s2s-events",
    "key.converter":"org.apache.kafka.connect.storage.StringConverter",
    "value.converter":"org.apache.kafka.connect.json.JsonConverter",
    "key.converter.schemas.enable":"false",
    "value.converter.schemas.enable":"false",
    "confluent.topic.bootstrap.servers":"${CLOUD_URL}",
    "confluent.topic.replication.factor":"6"
    "confluent.topic.sasl.jaas.config": "org.apache.kafka.common.security.plain.PlainLoginModule required username=\"${CLOUD_TOKEN}\" password=\"${CLOUD_SECRET}\";",
    "confluent.topic.security.protocol":"SASL_SSL",
    "confluent.topic.sasl.mechanism":"PLAIN",
    "tasks.max": "1"
    }
}
EOF
)

curl -X POST -H "${HEADER}" --data "${DATA}" http://localhost:8083/connectors
