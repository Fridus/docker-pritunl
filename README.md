# pritunl
https://pritunl.com/

1. Get image
```
docker pull fridus/pritunl
```

2. Create container
```
docker run -d -it \
  --privileged \
  -p 1194:1194/udp -p 1195:1195/udp -p 9700:9700/tcp \
  --name="pritunl" \
  fridus/pritunl
```

3. Configure  
-> https://ip:9700
