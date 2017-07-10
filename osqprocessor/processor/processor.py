from logger.logger import Logger

class Processor():
    workers = []
    l = Logger(__name__)
    def __init__(self):
        ""
    def register(self, worker):
        self.workers.append(worker)
        self.l.debug("worker registered: {}".format(worker))

    def process(self, message):
        for worker in self.workers:
            if worker.match(message):
                message = worker.run(message)
        return message
