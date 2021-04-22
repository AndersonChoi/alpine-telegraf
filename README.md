# Telegraf with alpine docker

## Versions

Alpine : `3.7`   
Telegraf : `1.18.1`   

## build, run Commands

```
$ docker build -t alpine-telegraf:1.0 .
$ docker run -p 9933:9933 alpine-telegraf:1.0 
```

## Test

```
$ curl localhost:9933/metrics
```