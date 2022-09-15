effet et utilisation de --security-opt=no-new-privileges
===============================================

## Dockerfile
```
from debian:latest
ARG USER=test
ARG GROUP=test
ARG UID=1010
ARG GID=1010
ARG PW=test


RUN groupadd -g ${GID} ${GROUP} && useradd -g ${UID}  ${USER} && echo "${USER}:${PW}" |chpasswd
ADD testnnp /tmp/testnnp
RUN chmod +s /tmp/testnnp
USER test
CMD /tmp/testnnp
```
## build and run with && without
 
```
docker build -t testnnp .
docker run -it --rm  testnnp                                                                                                                                                                   ─╯
Effective uid: 0

docker run -it --rm  --security-opt=no-new-privileges  testnnp                                                                                                                                 ─╯
Effective uid: 1000
```
# docker-secu-priv
