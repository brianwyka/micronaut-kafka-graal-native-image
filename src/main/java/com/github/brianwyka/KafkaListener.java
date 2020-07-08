package com.github.brianwyka;

import io.micronaut.configuration.kafka.annotation.Topic;
import org.apache.kafka.clients.consumer.ConsumerRecord;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

@io.micronaut.configuration.kafka.annotation.KafkaListener(
        groupId = "bicycles"
)
public class KafkaListener {

    private static final Logger LOGGER = LoggerFactory.getLogger(KafkaListener.class);

    @Topic("bicycles")
    public void consume(final ConsumerRecord<String, byte[]> consumerRecord) {
        LOGGER.debug("Consumed bicycle record with key: {}", consumerRecord.key());
    }

}
