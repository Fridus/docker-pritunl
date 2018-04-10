# pritunl
https://pritunl.com/ - https://github.com/pritunl/pritunl

## Supported tags

- `1.29.1670.66`, `latest`, `latest-debian`, `latest-centos`
- `1.29.1669.3`
- `1.28.1379.82`
- `1.25.1134.24`
- `1.25.1054.4`
- `1.25.1039.56`
- `1.21.941.39`
- `1.16.884.17`


## 1. Get image

```
docker pull fridus/pritunl
```


## 2. Create container

###  Setup on `run`

#### Link to mongo

```
docker run -d -it \
  --privileged \
  --link mongodb:mongo \
  -p 1194:1194/udp -p 1195:1195/udp -p 9700:443/tcp -p 443:443/tcp \
  --name="pritunl" \
  fridus/pritunl
```

`/!\` The alias of the mongodb container must be `mongo`

#### Set `Mongo URI`

```
docker run -d -it \
  --privileged \
  --e MONGO_URI=mongodb://xx.xx.xx.xx:27017/pritunl \
  -p 1194:1194/udp -p 1195:1195/udp -p 9700:443/tcp -p 443:443/tcp \
  --name="pritunl" \
  fridus/pritunl
```


## 3. Configure and use

- https://myvpnserver or https://myvpnserver:9700
- Default login and password : `pritunl`
