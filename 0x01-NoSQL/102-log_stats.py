#!/usr/bin/env python3

'''A Python module that provides stats about nginx and top 10 IPs'''

from pymongo import MongoClient

if __name__ == '__main__':
    '''Prints the log stats in nginx collection along with the top 10 IPs'''
    con = MongoClient('mongodb://localhost:27017')
    collection = con.logs.nginx

    # Print total logs
    print(f'{collection.estimated_document_count()} logs')

    # Count request methods
    methods = ['GET', 'POST', 'PUT', 'PATCH', 'DELETE']
    print('Methods:')
    for req in methods:
        print(f'\tmethod {req}: {collection.count_documents({"method": req})}')

    # Count specific GET requests to /status
    print(f'{collection.count_documents({"method": "GET", "path": "/status"})} status check')

    # Top 10 IPs
    print("IPs:")
    top_ips = collection.aggregate([
        {"$group": {"_id": "$ip", "count": {"$sum": 1}}},
        {"$sort": {"count": -1}},
        {"$limit": 10}
    ])
    for ip in top_ips:
        print(f'\t{ip["_id"]}: {ip["count"]}')
