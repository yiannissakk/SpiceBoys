import random
import datetime
with open("ordersTable.txt", "w") as table:
    for i in range(1,101):
            table.write("{order_id: " +str(i)+ ", user_id: " +str(random.randint(1,100))+ ", timestamp: " + str(datetime.datetime.now()) + "}")
