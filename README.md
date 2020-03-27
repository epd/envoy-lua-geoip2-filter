# GeoIP2 HTTP filter for Envoy
This plugin is written in Lua and designed to be used as an HTTP filter for the
Envoy proxy.

It simply translates the requester's IP address into a country code by looking
up in a Maxmind GeoIP2 database.

### Example
``` bash
$ curl http://localhost:8000 -H 'x-forwarded-for: 31.133.192.255'
{
  "path": "/",
  "headers": {
    "host": "localhost:8000",
    "user-agent": "curl/7.54.0",
    "accept": "*/*",
    "x-forwarded-for": "31.133.192.255,172.22.0.1",
    "x-forwarded-proto": "http",
    "x-envoy-external-address": "31.133.192.255",
    "x-request-id": "720937ba-3713-46aa-a35f-8c1ea13d822d",
    "x-country": "RO",
    "x-envoy-expected-rq-timeout-ms": "15000",
    "content-length": "0"
  },
  "method": "GET",
  "body": "",
  "fresh": false,
  "hostname": "localhost",
  "ip": "::ffff:172.22.0.3",
  "ips": [],
  "protocol": "http",
  "query": {},
  "subdomains": [],
  "xhr": false,
  "os": {
    "hostname": "fb61882427f7"
  }
}
```
