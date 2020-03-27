# GeoIP2 HTTP filter for Envoy
This plugin is written in Lua and designed to be used as an HTTP filter for the
Envoy proxy.

It simply translates the requester's IP address into a country code by looking
up in a Maxmind GeoIP2 database.
