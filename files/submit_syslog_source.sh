HEADER="Content-Type: application/json"
DATA=$( cat << EOF
{
  "name": "syslog-tcp",
  "config": {
    "connector.class": "io.confluent.connect.syslog.SyslogSourceConnector",
    "kafka.topic": "confluent_syslog_connector",
    "topic":"confluent_syslog_connector",
    "confluent.topic.replication.factor": 6,
    "confluent.topic.bootstrap.servers":"${CLOUD_URL}",
    "confluent.topic.security.protocol" : "SASL_SSL",
    "confluent.topic.sasl.jaas.config": "org.apache.kafka.common.security.plain.PlainLoginModule required username=\"${CLOUD_TOKEN}\" password=\"${CLOUD_SECRET}\";",
    "confluent.topic.sasl.mechanism"    : "PLAIN",
    "value.converter": "org.apache.kafka.connect.json.JsonConverter",
    "value.converter.schemas.enable": "false",
    "syslog.listener": "TCP",
    "syslog.port": "5555",
    "tasks.max": "1"
  }
}
EOF
)

curl -X POST -H "${HEADER}" --data "${DATA}" http://localhost:8083/connectors