#!/usr/bin/python
# Web Events data generations script
#
import sys
import json
import time
import datetime

def createWebEvents(nEvents):
    evId = 12345100
    uId = 0
    status = ['Error', 'Success', 'Warning', 'Unknown']
    browser = ['IE', 'Safari', 'FireFox', 'Opera', 'Mozilla']
    rURL = ['jet.com', 'amazon.com', 'ebay.com', 'grocers.com', 'foods.com']
    hCommands = ['Get', 'Head', 'Post', 'Put']
    # Orig IP scheme TBD
    webEvents = []
    for i in range(nEvents):
        tStamp = time.time()
        evId = evId + 1
        uId = uId + i%5
        origIP = '10.11.12.13' #TBD
        uBrowser = browser[i%5]
        nBytes = 2500 # TBD
        httpCommand = hCommands[i%4]
        evStatus = status[i%4]
        refURL = rURL[i%5]
        #webEvents = []
        
        eventRec   = {'wev_timestamp': tStamp, 'wev_event_id': evId,
                 'wev_user_id': uId, 'wev_user_orig_ip': origIP,
                 'wev_user_browser': uBrowser, 'wev_num_bytes': nBytes,
                 'wev_http_command': httpCommand, 'wev_status': evStatus,


                'wev_referring_url': refURL}
        
                 
        webEvents.append(eventRec)

    return webEvents

if __name__ == "__main__":
    numEvents = sys.argv[1]
    events_data = createWebEvents(int(numEvents))

    with open('web_events_table.json', 'w') as outfile:
        for record in events_data:
            json.dump(record, outfile, sort_keys=True)
            outfile.write('\n')
