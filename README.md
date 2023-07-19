# Confluent Cloud Connect - Splunk S2S
Quicky get access to Confluent Cloud with this script. This repo runs a standalone Kafka connect worker which is preconfigured to connect to a Confluent Cloud instance.
It includes two source connectors:

To get started:
```
1. git clone https://github.com/JohnnyMirza/ccloud_connect_Splunk_S2S.git
2. edit the .env file and fill in your credentials.
3. Create your topic in Confluent Cloud (see .env file)
4. echo (or source) .env
4. docker-compose up -d
```

This repo includes a Splunk S2S source connector, and snowflake sink connector. Fill in connectivity details in:
```
-submit_Splunk_s2s.sh
```
