#!/bin/bash
source ".env"

HEADER="Content-Type: application/json"
DATA=$( cat << EOF
{
  "name": "cdc-oracle-source-cdb-cc-1",
  "config":{
    "connector.class": "io.confluent.connect.oracle.cdc.OracleCdcSourceConnector",
    "oracle.password": "${ORACLE_PASSWORD}",
    "oracle.sid": "${ORACLE_SID}",
    "redo.log.consumer.bootstrap.servers": "${CLOUD_URL}",
    "redo.log.consumer.sasl.jaas.config":"org.apache.kafka.common.security.plain.PlainLoginModule required username=\"${CLOUD_TOKEN}\" password=\"${CLOUD_SECRET}\";",
    "redo.log.consumer.security.protocol":"SASL_SSL",
    "redo.log.consumer.sasl.mechanism":"PLAIN",
    "oracle.dictionary.mode": "auto",
    "topic.creation.default.partitions": "3",
    "table.topic.name.template": "${CONFLUENT_TOPIC_NAME_TEMPLATE}",
    "tasks.max": "2",
    "topic.creation.redo.partitions": "3",
    "topic.creation.redo.include": "${KAFKA_TOPIC_REDO}",
    "confluent.license": "${CONFLUENT_LICENSE}",
    "connection.pool.max.size": "20",
    "confluent.topic.replication.factor": "3",
    "topic.creation.default.replication.factor": "3",
    "topic.creation.redo.retention.ms": "1209600000",
    "value.converter": "io.confluent.connect.avro.AvroConverter",
    "key.converter": "io.confluent.connect.avro.AvroConverter",
    "redo.log.row.fetch.size": "1",
    "oracle.server": "${ORACLE_SERVER}",
    "confluent.topic.bootstrap.servers": "${CLOUD_URL}",
    "confluent.topic.sasl.jaas.config": "org.apache.kafka.common.security.plain.PlainLoginModule required username=\"${CLOUD_TOKEN}\" password=\"${CLOUD_SECRET}\";",
    "confluent.topic.security.protocol":"SASL_SSL",
    "confluent.topic.sasl.mechanism":"PLAIN",
    "topic.creation.redo.replication.factor": "1",
    "topic.creation.default.cleanup.policy": "delete",
    "oracle.port": "${ORACLE_PORT}",
    "topic.creation.redo.cleanup.policy": "delete",
    "oracle.username": "${ORACLE_USERNAME}",
    "value.converter.basic.auth.credentials.source":"USER_INFO",
    "value.converter.schema.registry.basic.auth.user.info":"${SCHEMA_REGISTRY_BASIC_AUTH}",
    "value.converter.schema.registry.url": "${SCHEMA_REGISTRY_URL}",
    "start.from": "snapshot",
    "table.inclusion.regex": "${ORACLE_TABLE_INCLUSION_REGEX}",
    "numeric.mapping": "best_fit",
    "redo.log.topic.name": "${KAFKA_TOPIC_REDO}",
    "key.converter.schema.registry.url": "${SCHEMA_REGISTRY_URL}",
    "key.converter.basic.auth.credentials.source":"USER_INFO",
    "key.converter.schema.registry.basic.auth.user.info":"${SCHEMA_REGISTRY_BASIC_AUTH}"
    }
}
EOF
)

curl -X POST -H "${HEADER}" --data "${DATA}" http://localhost:8083/connectors
