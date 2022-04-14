docker network create test-infulx
docker run --name influxdb --net test-infulx -p 8086:8086 influxdb:2.2.0
docker run -d --name=grafana --net test-infulx -p 3000:3000 grafana/grafana-oss
