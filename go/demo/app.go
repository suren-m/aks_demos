package main

import (
	"context"
	"fmt"
	"os"

	"github.com/go-redis/redis/v8"
)

var ctx = context.Background()

// redis-benchmark -h $CACHE_HOST.redis.cache.windows.net -p 6380 -a $CACHE_KEY

func main() {
	rdb := redis.NewClient(&redis.Options{
		Addr:     "akscache.redis.cache.windows.net:6380",
		Password: os.Getenv("CACHE_KEY"),
	})

	err := rdb.Set(ctx, "foo", "go gold", 0).Err()
	if err != nil {
		panic(err)
	}

	val, err := rdb.Get(ctx, "foo").Result()
	if err != nil {
		panic(err)
	}
	fmt.Println("key", val)
}
