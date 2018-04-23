
A simple program to accept connections, read from them, and write the result to
stdout.

Why not use `nc` you ask? It doesn't handle multiple concurrent connections.

Why not `inetd`? Well, this is a lot simpler and took me two minutes to write.

# Supported tags and respective `Dockerfile` links

- `latest` [(Dockerfile)][latest-dockerfile]

# Usage

```bash
docker run \
    --publish 8080:8080 \
    jasonkeene/tcp-to-stdout
```

Then in another terminal:

```bash
nc localhost 8080
```

You can override the port it listens on with the env var `ADDR`. For instance:

```bash
docker run \
    --publish 9090:9090 \
    --env ADDR=:9090 \
    jasonkeene/tcp-to-stdout
```

[latest-dockerfile]: https://github.com/jasonkeene/tcp-to-stdout/blob/master/Dockerfile
