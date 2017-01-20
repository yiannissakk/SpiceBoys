import psycopg2
import collections
from collections import defaultdict
import operator

con=psycopg2.connect(dbname= 'spiceboysredshift', host='spice-boys-redshift-cluster.cp1oqvdsoh97.us-east-1.redshift.amazonaws.com', 
port= '5439', user= '', password= '')

cur = con.cursor()

cur.execute("""SELECT p_product_id, p_price from product""")

product_prices = cur.fetchall()
prod_dict = defaultdict(int)
for row in product_prices:
    print type(row[0])
    prod_dict[row[0]] = row[1]

cur.execute("""select orders.o_user_id, order_details.od_product_id, order_details.od_quantity from order_details join orders on o_order_id = od_order_id""")

upq = cur.fetchall()

aaa = defaultdict(int)

for row in upq:
    aaa[row[0]] += row[2]*prod_dict[row[1]]

newaaa = dict(sorted(aaa.iteritems(), key=operator.itemgetter(1), reverse=True)[:10])

print newaaa
