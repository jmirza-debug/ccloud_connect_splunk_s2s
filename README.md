# Confluent Cloud Connect - Splunk S2S
Quicky get access to Confluent Cloud with this script. This repo runs a standalone Kafka connect worker which is preconfigured to connect to a Confluent Cloud instance.
It includes two source connectors:

To get started:
```
1. git clone
2. edit the .env file and fill in your credentials.
3. Create the topic splunk-s2s-events
4. source .env
4. docker-compose up -d
```

This repo includes:
Splunk S2S source connector
Splunk UF
Splunk EventGen, generating Cisco ASA Data

Once data is in cloud, follow the steps in "Demo Script" in this repo to setup KSQLDB Queries. https://github.com/JohnnyMirza/confluent_splunk_demo

-- Still to do --
Add Sigma
Create Splunk Sink
