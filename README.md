# docker-centos image

This is a working yum image of centos 5.11 which is EOL, can be graet for multistage builds for compiling source code and copy to a clean iamge

Example:

```bash
FROM minervaprime/centos:5.11-gcc AS Builder
COPY . /usr/src/app
RUN make

FROM centos:5.11
COPY --from=Builder /usr/src/app/artifact /usr/local/bin/
CMD [ "/usr/local/bin/artifact" ]
```

Docker image location: <https://hub.docker.com/r/minervaprime/centos/>
