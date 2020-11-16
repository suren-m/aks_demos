import requests
import redis
import os

r = redis.Redis(
  host='akscache.redis.cache.windows.net',
  port='6380',
  password=os.environ['CACHE_CRED'],
  ssl=True
)

r.set('foo','demo again')

print(r.get('foo'))

print("\n..press any key to exit..\n")
input()