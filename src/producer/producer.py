
from kafka import KafkaProducer
import time
import json

from reader import Reader


class Producer:
    def __init__(self, topic, freq):
        self.topic = topic
        self.freq = freq if isinstance(freq, int) else int(freq)
        self.producer = KafkaProducer(
            bootstrap_servers='localhost:9092',
            value_serializer=lambda x: json.dumps(x).encode('utf-8')
            )

        self.reader = Reader()
    
    def start_write(self):
        
        self.producer.send(self.topic, value=self.reader.get_data())
        time.sleep(self.freq)
        

if __name__ == '__main__':
    # Test the functions
    producer = Producer('test', 1)
    producer.start_write()
