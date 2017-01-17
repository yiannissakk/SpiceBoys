import random
import datetime
import json
import csv
from csv import DictWriter

order_data = []

for i in range(1,101):
        order_data.append({"order_id": i, "user_id": random.randint(1,100), "timestamp": datetime.datetime.now()})

fieldnames = ['order_id', 'user_id', 'timestamp']
with open('ordersTable.csv', 'w') as outfile:
        writer = DictWriter(outfile, fieldnames=fieldnames)
        writer.writerows(order_data)
