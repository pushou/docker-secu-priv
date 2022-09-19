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
