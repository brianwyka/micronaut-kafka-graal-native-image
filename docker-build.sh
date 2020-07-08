#!/bin/sh
docker build . -t micronaut-kafka-graal-native-image
echo
echo
echo "To run the docker container execute:"
echo "    $ docker run -p 8080:8080 micronaut-kafka-graal-native-image"
