PORT=6379
ADDR="redis://$CACHE_KEY@$CACHE_HOST:$PORT"

printf "\n----\nHost Info: "
echo `hostname && hostname -i` | tr '\n' ' '
printf "\n\n"

printf "Target DNS: "
echo `dig +short $CACHE_HOST` | tr '\n' ' '
printf "\n\n"

# https://redis.io/topics/rediscli#:~:text=The%20stats%20are%20provided%20in,easily%20be%200.01%20or%20less.
printf "\nRunning latency check on $CACHE_HOST:$PORT- `date`\n\n"
redis-cli --no-auth-warning --latency -u $ADDR