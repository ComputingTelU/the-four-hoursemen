from circular import circular
from upflow_downflow import upflow_downflow
from upflow_broadcast import upflow_broadcast
from upflow_broadcast_response import upflow_broadcast_response
from memory_profiler import memory_usage
from data import data
import time

f = open('result', 'w')

for q in [2,3,5,7]:
    for n in range(3,21+1):
        for r in range(3,20+1):
            f.write('n = ')
            f.write(str(n))
            f.write('\n')
            f.write('q = ')
            f.write(str(q))
            f.write('\n')
            f.write('r = ')
            f.write(str(r))
            f.write('\n')

            start = time.time()
            circular(r, data[q][n]['M'], data[q][n]['v'])
            end = time.time()
            f.write('circular: ')
            f.write(str(end-start))
            f.write('\n')
            mem_usage = memory_usage((circular, ((r, data[q][n]['M'], data[q][n]['v']))))
            f.write('circular memory: ')
            f.write(str(max(mem_usage)))
            f.write('\n')

            start = time.time()
            upflow_broadcast_response(r, data[q][n]['M'], data[q][n]['v'])
            end = time.time()
            f.write('upflow broadcast response: ')
            f.write(str(end-start))
            f.write('\n')
            mem_usage = memory_usage((upflow_broadcast_response, ((r, data[q][n]['M'], data[q][n]['v']))))
            f.write('upflow broadcast response memory: ')
            f.write(str(max(mem_usage)))
            f.write('\n')

            start = time.time()
            upflow_broadcast(r, data[q][n]['M'], data[q][n]['v'])
            end = time.time()
            f.write('upflow broadcast: ')
            f.write(str(end-start))
            f.write('\n')
            mem_usage = memory_usage((upflow_broadcast, ((r, data[q][n]['M'], data[q][n]['v']))))
            f.write('upflow_broadcast memory: ')
            f.write(str(max(mem_usage)))
            f.write('\n')

            start = time.time()
            upflow_downflow(r, data[q][n]['M'], data[q][n]['v'])
            end = time.time()
            f.write('upflow downflow: ')
            f.write(str(end-start))
            f.write('\n')
            mem_usage = memory_usage((upflow_downflow, ((r, data[q][n]['M'], data[q][n]['v']))))
            f.write('upflow downflow memory: ')
            f.write(str(max(mem_usage)))
            f.write('\n')

            f.write('\n')

f.close()
