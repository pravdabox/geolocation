#!/bin/bash

if [[ ! -f IP2LOCATION-LITE-DB5.CSV.ZIP ]]; then
    echo 'Download and copy IP2LOCATION-LITE-DB5.CSV.ZIP to this directory first! (https://lite.ip2location.com/file-download)'
    exit 1
fi

# extract
unzip IP2LOCATION-LITE-DB5.CSV.ZIP
echo

echo "running import..."
mysql -u root --password=root --local-infile ip2location < import-csv.sql

echo "running export..."
mysqldump -u root --password=root ip2location > geolocation/files/ip2location_db5.sql

echo "compressing..."
rm geolocation/files/ip2location_db5.sql.xz
xz -9e geolocation/files/ip2location_db5.sql

echo "done."

# cleanup
rm LICENSE_LITE.TXT
rm README_LITE.TXT
rm IP2LOCATION-LITE-DB5.CSV
