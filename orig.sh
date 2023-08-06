#!/bin/sh

# accepts list of domains one per line on standard input, emits unique A records for said domains (assuming no errors, etc).

( while read domain; do
  dig +short A "$domain"; done ) | sort -u
