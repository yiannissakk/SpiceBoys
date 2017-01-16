import sys
import json
import random


def create_order_details(num_orders):

    data = []

    for i in range(num_orders):

        order_id = i
        product_id = random.randint(1, 10)

        rand_num = random.random()

        if rand_num < 0.85:
            quantity = 1
        elif rand_num < 0.95:
            quantity = 2
        else:
            quantity = 3

        order_details_record = {'order_id': order_id, 'product_id': product_id, 'quantity': quantity}

        data.append(order_details_record)

    return data


if __name__ == '__main__':

    num = sys.argv[1]  # first argument is number of records to create

    order_details_data = create_order_details(int(num))

    with open('order_details_table.json', 'w') as outfile:
        for record in order_details_data:
            json.dump(record, outfile, sort_keys=True)
            outfile.write('\n')