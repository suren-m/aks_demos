PORT=6379
ADDR="redis://$CACHE_KEY@$CACHE_HOST:$PORT"
redis-cli --no-auth-warning --latency -u $ADDR