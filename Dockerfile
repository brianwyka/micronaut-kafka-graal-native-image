FROM oracle/graalvm-ce:20.1.0-java8 as graalvm
RUN gu install native-image

COPY . /home/app/micronaut-kafka-graal-native-image
WORKDIR /home/app/micronaut-kafka-graal-native-image

RUN native-image --no-server --no-fallback --static -cp target/micronaut-kafka-graal-native-image-*.jar

FROM frolvlad/alpine-glibc
RUN apk update && apk add libstdc++
EXPOSE 8080
COPY --from=graalvm /home/app/micronaut-kafka-graal-native-image/micronaut-kafka-graal-native-image /app/micronaut-kafka-graal-native-image
ENTRYPOINT ["/app/micronaut-kafka-graal-native-image"]
