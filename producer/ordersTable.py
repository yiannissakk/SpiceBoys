import random
import sys
import datetime
import json
import csv
from csv import DictWriter


def create_orders_json(num_users, num_orders):
        o_data = []

        for i in range(1,num_orders+1):
                o_data.append({"order_id": i, "user_id": random.randint(1,num_users), "timestamp": datetime.datetime.now()})
        return o_data

if __name__ == '__main__':
        num1 = int(sys.argv[1])
        num2 = int(sys.argv[2])
        order_data = create_orders_json(num1, num2)
        fieldnames = ['order_id', 'user_id', 'timestamp']
        with open('ordersTable.csv', 'w') as outfile:
                writer = DictWriter(outfile, fieldnames=fieldnames)
                writer.writerows(order_data)
