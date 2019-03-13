# rails_proxy_server

A simple server to proxy HTTP calls to an API and cache the results. Uses an in-memory cache from MiniCache.

## Setup

```
bundle
```

## How to run

```
rails s
```

## Examples

```
http://localhost:3000/articles?page=1
http://localhost:3000/articles?page=2
...
```

## Hot to run tests

```
rspec
```
