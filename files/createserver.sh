#!/bin/sh

#set -x

# Check if the REST_URL has been set in the environment.
if [ -z "$REST_URL" ] ; then

    # Set the REST_URL to the default.
    REST_URL=http://localhost:9001/v1
fi

NAME=$1

curl -i \
-H "Content-Type: application/json" \
-H "Accept: application/json" \
-H "X-Auth-Token: $TOKEN" \
-X POST \
-d '{"name":"'$NAME'"}' \
$REST_URL/servers

echo ""
exit 0
