print("..starting..")

import requests
import redis
import os

# https://redis.io/topics/benchmarks
# https://docs.microsoft.com/en-us/azure/azure-cache-for-redis/cache-python-get-started#read-and-write-to-the-cache

# redis-cli -u redis://$CACHE_KEY=@$CACHE_HOST.redis.cache.windows.net:6379

cache_host = os.environ['CACHE_HOST'] + '.redis.cache.windows.net'
cache_key = os.environ['CACHE_KEY']

# r = redis.StrictRedis(
#   host='v6.redis.cache.windows.net',
#   port='6380',
#   password=cache_key,
#   ssl=True
# )

# StrictRedis for SSL
r = redis.Redis(
  host=cache_host,
  port='6379',
  password=cache_key
)

r.set('foo','demoss2')

while True:
  res = r.get('foo')
  print(res)

print('done')


