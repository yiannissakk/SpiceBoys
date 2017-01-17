import json
import csv
from csv import DictWriter

spices = [{"name": "Oregano", "product_id": 1, "description": "sadhjvczvczfvj", "category": 1, "price": 6, "marginal_cost": 1, "manufacturer_id": 1, "weight": 1},\
{"name": "Saffron", "product_id": 2, "description": "sadhjvczvczfvj", "category": 3, "price": 10, "marginal_cost": 4, "manufacturer_id": 2, "weight": 2},\
{"name": "Himalayan Salt", "product_id": 3, "description": "sadhjvczvczfvj", "category": 2, "price": 9, "marginal_cost": 3, "manufacturer_id": 1, "weight": 1},\
{"name": "Nutmeg", "product_id": 4, "description": "sadhjvczvczfvj", "category": 1, "price": 7, "marginal_cost": 2, "manufacturer_id": 2, "weight": 2},\
{"name": "Cloves", "product_id": 5, "description": "sadhjvczvczfvj", "category": 1, "price": 8, "marginal_cost": 2, "manufacturer_id": 3, "weight": 1},\
{"name": "Curry", "product_id": 6, "description": "sadhjvczvczfvj", "category": 2, "price": 4, "marginal_cost": 1, "manufacturer_id": 3, "weight": 2},\
{"name": "Thyme", "product_id": 7, "description": "sadhjvczvczfvj", "category": 1, "price": 6, "marginal_cost": 2, "manufacturer_id": 2, "weight": 2},\
{"name": "Marjoram", "product_id": 8, "description": "sadhjvczvczfvj", "category": 1, "price": 6, "marginal_cost": 2, "manufacturer_id": 1, "weight": 2},\
{"name": "Cinammon", "product_id": 9, "description": "sadhjvczvczfvj", "category": 3, "price": 5, "marginal_cost": 1, "manufacturer_id": 1, "weight": 2},\
{"name": "Ground Mustard", "product_id": 10, "description": "sadhjvczvczfvj", "category": 3, "price": 8, "marginal_cost": 1, "manufacturer_id": 3, "weight": 1}]

fieldnames = ['name', 'product_id', 'description', 'category', 'price', 'marginal_cost', 'manufacturer_id', 'weight']
with open('productsTable.csv', 'w') as outfile:
        writer = DictWriter(outfile, fieldnames=fieldnames)
        writer.writerows(spices)


