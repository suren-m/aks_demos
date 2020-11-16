use std::env;

extern crate redis;
use redis::Commands;

// https://redislabs.com/lp/redis-enterprise-rust/
// https://github.com/mitsuhiko/redis-rs

fn main() { 
    let addr = "akscache.redis.cache.windows.net";
    let cred = env::var("CACHE_CRED").unwrap();
    let port = 6380;
    let url = format!(
        "redis://u:{}@{}:{}",
        cred,
        addr,
        port);
    
    println!("{}", url);
    /*
    let client = redis::Client::open(url).unwrap();
    let mut con = client.get_connection().unwrap();
    let res: String = con.get("foo").unwrap();
    println!("Res: {}", res);
    */
}
