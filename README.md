# CGIT docker container

[cgit](https://git.zx2c4.com/cgit/about/) docker container using:
- nginx
- fcgiwrap
- [supervisord](http://supervisord.org/)

Scans and displays every repository under `/git`


## Develop
### Build
```sh
# Docker
make build
# Podman
make DOCKER=podman build
```

### Run
```sh
make run
# Podman
make DOCKER=podman run
```

## References
### General
- https://bryanbrattlof.com/cgit-nginx-gitolite-a-personal-git-server/
- https://blog.stefan-koch.name/2020/02/16/installing-cgit-nginx-on-debian
- https://peppe.rs/posts/self-hosting_git/
- https://blog.dejavu.moe/posts/hosting-minimal-git-server-with-cgit/#%E5%AE%89%E8%A3%85-cgit

### fcgiwrap
- https://www.nginx.com/resources/wiki/start/topics/examples/fcgiwrap/
- https://sleeplessbeastie.eu/2017/09/18/how-to-execute-cgi-scripts-using-fcgiwrap/

### supervisord
- http://supervisord.org/configuration.html

### CGIT servers
- https://git.peppe.rs/
- https://git.zx2c4.com/
- https://git.kernel.org/
- https://git.xvo.es/
