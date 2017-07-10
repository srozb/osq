from processor.workers.abstract_worker import AbstractWorker

class Worker(AbstractWorker):
    name = "Debug Worker"
    def __init__(self):
        self._setup_logger(__name__)
    def run(self, message):
        "debug worker will only log the message content"
        self.debug("processing message: {}".format(message))
        return message
