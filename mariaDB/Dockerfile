FROM debian:bookworm
RUN printf '#!/bin/sh\nexit 0' > /usr/sbin/policy-rc.d
COPY script.sh /etc/script.sh
ENV MARIADB_DATABASE=test
ENV MARIADB_USER=user
ENV MARIADB_USER_PASSWORD=user_password
ENV MARIADB_ROOT_PASSWORD=root_password
RUN /bin/bash /etc/script.sh
EXPOSE 3307:3306
ENTRYPOINT ["mariadbd", "--user=root"]
