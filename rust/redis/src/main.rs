use std::env;
extern crate redis;
use redis::Commands;

// https://redislabs.com/lp/redis-enterprise-rust/
// https://github.com/mitsuhiko/redis-rs

fn main() {
    let hostname = env::var("CACHE_HOST").unwrap();
    let passwd = env::var("CACHE_KEY").unwrap();
    
    let port = 6379;
    let url = format!(
        "redis://{}@{}.redis.cache.windows.net:{}",
        passwd, hostname, port
    );

    println!("{}", url);
    let client = redis::Client::open(url).unwrap();
    let mut con = client.get_connection().unwrap();
    let res: String = con.get("foo").unwrap();
    println!("Res: {}", res);
}
