# pritunl
https://pritunl.com/

## 1. Get image

```
docker pull fridus/pritunl
```


## 2. Create container

```
docker run -d -it \
  --privileged \
  -p 1194:1194/udp -p 1195:1195/udp -p 9700:9700/tcp \
  --name="pritunl" \
  fridus/pritunl
```

###  Setup on `run`

#### Link to mongo

```
docker run -d -it \
  --privileged \
  --link mongodb \
  -p 1194:1194/udp -p 1195:1195/udp -p 9700:9700/tcp \
  --name="pritunl" \
  fridus/pritunl
```

#### Set `Mongo URI`

```
docker run -d -it \
  --privileged \
  --e MONGO_URI=mongodb://xx.xx.xx.xx:27017/pritunl \
  -p 1194:1194/udp -p 1195:1195/udp -p 9700:9700/tcp \
  --name="pritunl" \
  fridus/pritunl
```


## 3. Configure and use  

-> https://xx.xx.xx.xx:9700
