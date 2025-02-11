printf "Initializing..\n"

set -e

PORT=6379

ADDR="redis://$CACHE_KEY@$CACHE_HOST:$PORT"

printf "Redis Info\n"
redis-cli --no-auth-warning -u $ADDR -c "INFO"

printf "\n----\nHost Info: "
echo `hostname && hostname -i` | tr '\n' ' '
printf "\n\n"

printf "Target DNS: "
echo `dig +short $CACHE_HOST` | tr '\n' ' '
printf "\n\n"

printf "Flushing keys.."
redis-cli --no-auth-warning -u $ADDR -c "FLUSHALL"
printf "\n"

# https://redis.io/topics/benchmarks
printf "Running redis-benchmark on $CACHE_HOST:$PORT - `date`\n\n" | tee -a results
redis-benchmark \
-h $CACHE_HOST \
-p $PORT \
-a $CACHE_KEY \
-q \
| tee -a results

printf "\n..done..\n"
