# CGIT docker

[cgit](https://git.zx2c4.com/cgit/about/) docker container using:

Scans and displays every repository under `/git`

## Usage

```sh
docker run -d \
    --volume ${PWD}/volumes/git:/git \
    --tmpfs /var/cache/cgit \
    --publish 8080:80 \
    --name cgit \
    ${DOCKER_TAG}
```

In the above example, local port `8080` is mapped into the container HTTP port `80`. The local `volumes/git` folder is used as `/git` by the container, for storing all the git repositories. As a cache folder, a `tmpfs` mount is used.

## References
### General
- https://bryanbrattlof.com/cgit-nginx-gitolite-a-personal-git-server/
- https://blog.stefan-koch.name/2020/02/16/installing-cgit-nginx-on-debian
- https://peppe.rs/posts/self-hosting_git/
- https://blog.dejavu.moe/posts/hosting-minimal-git-server-with-cgit/#%E5%AE%89%E8%A3%85-cgit

### CGIT servers
- https://git.peppe.rs/
- https://git.zx2c4.com/
- https://git.kernel.org/
- https://git.xvo.es/
