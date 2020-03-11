# experia-v10-exporter
A [prometheus](https://prometheus.io) exporter for getting some metrics of an Experia Box v10 (H369A)

## Installation
If you have a working Go installation, getting the binary should be as simple as

```
go get github.com/wouter0100/experia-v10-exporter
```

## Usage
```plain
$ experia-v10-exporter
```

The following environment variables are required:
```
EXPERIA_V10_LISTEN_ADDR=localhost:9684 
EXPERIA_V10_TIMEOUT=10 
EXPERIA_V10_ROUTER_IP=192.168.2.254
EXPERIA_V10_ROUTER_USERNAME=Admin 
EXPERIA_V10_ROUTER_PASSWORD="PASSWORD"
```

## Metrics
The following metrics are currently returned:
```
# HELP experia_v10_auth_errors_total Counts number of authentication errors encountered by the collector.
# TYPE experia_v10_auth_errors_total counter
experia_v10_auth_errors_total 1
# HELP experia_v10_ethernet All ethernet (eth) related metadata.
# TYPE experia_v10_ethernet counter
experia_v10_ethernet{value="BytesReceived"} 2.317513886e+09
experia_v10_ethernet{value="BytesSent"} 3.143624272e+09
experia_v10_ethernet{value="LinkSpeed"} 1000
experia_v10_ethernet{value="PacketsReceived"} 3.117515244e+09
experia_v10_ethernet{value="PacketsSent"} 1.823784509e+09
# HELP experia_v10_scrape_errors_total Counts the number of scrape errors by this collector.
# TYPE experia_v10_scrape_errors_total counter
experia_v10_scrape_errors_total 0
# HELP experia_v10_up Shows if the Experia Box V10 is deemed up by the collector.
# TYPE experia_v10_up gauge
experia_v10_up 1
```