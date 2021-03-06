#!/usr/bin/env bash

set +xv

ES_ADDR=${ES_ADDR:-"localhost:9200"}
ES_INDEX=${ES_INDEX:-"sonic-products"}

curl -v -w'\n' -XDELETE "http://${ES_ADDR}/${ES_INDEX}"
curl -w'\n' -X PUT "http://${ES_ADDR}/${ES_INDEX}?pretty" -H 'Content-Type: application/json' -d'
{
  "mappings": {
    "_doc": {
      "properties": {
        "event_time"  : { "type": "date"      },
        "location"    : { "type": "geo_point" },
        "food"        : { "type": "keyword"   },
        "storeId"     : { "type": "keyword"   },
        "city"        : { "type": "text"      },
        "cost"        : { "type": "float"     }
      }
    }
  }
}'