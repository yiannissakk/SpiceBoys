import sys
import json
import random

first_names = ['John','Jack','Rob','Elena','Jiwon','Mackensie','Charlene','David','Scott','Brad','Melissa','Mel','Zach']
last_names = ['Smith','Nguyen','Jackson','Roberts','Robertson','Baustista','Wright','Pollock','Anthony','Zenner','Perry']
streets = ['Willow Place','Main St','Pinewood Dr','Rampart Circle','Pine Terrace','Stonybrook Manor','5th Ave','75th St']
states = ["AL", "AK", "AZ", "AR", "CA", "CO", "CT", "DC", "DE", "FL", "GA",
          "HI", "ID", "IL", "IN", "IA", "KS", "KY", "LA", "ME", "MD",
          "MA", "MI", "MN", "MS", "MO", "MT", "NE", "NV", "NH", "NJ",
          "NM", "NY", "NC", "ND", "OH", "OK", "OR", "PA", "RI", "SC",
          "SD", "TN", "TX", "UT", "VT", "VA", "WA", "WV", "WI", "WY"]
email_suffixes = ['@gmail.com','@hotmail.com','@yahoo.com','@aol.com']


def create_users(num_users):

    data = []

    for i in range(num_users):

        user_id = i
        first_name = random.choice(first_names)
        last_name = random.choice(last_names)
        address = str(random.randint(1,599)) + ' ' + random.choice(streets)
        state = random.choice(states)
        zip_code = random.randint(10001, 99999)
        phone = random.randint(1000000000, 99999999999)
        email = first_name.lower() + last_name.lower() + random.choice(email_suffixes)

        user_record = {'user_id': user_id, 'first_name': first_name, 'last_name': last_name, 'address': address,
                       'state': state, 'zip_code': zip_code, 'phone': phone, 'email': email}

        data.append(user_record)

    return data


if __name__ == '__main__':

    num = sys.argv[1]  # first argument is number of user records to create

    user_data = create_users(int(num))

    with open('users_table.json', 'w') as outfile:
        for record in user_data:
            json.dump(record, outfile, sort_keys=True)
            outfile.write('\n')