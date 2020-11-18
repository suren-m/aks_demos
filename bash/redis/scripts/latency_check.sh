PORT=6379
ADDR="redis://$CACHE_KEY@$CACHE_HOST:$PORT"

printf "\nRunning latency check on $CACHE_HOST:$PORT\n\n"
redis-cli --no-auth-warning --latency -u $ADDR