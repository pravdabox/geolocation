#!/bin/bash

[[ -f IP2LOCATION-LITE-DB5.CSV.ZIP ]] || echo 'Download and copy IP2LOCATION-LITE-DB5.CSV.ZIP to this directory first! (https://lite.ip2location.com/file-download)' ; exit 1

unzip IP2LOCATION-LITE-DB5.CSV.ZIP
