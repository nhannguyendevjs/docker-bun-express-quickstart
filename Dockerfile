# syntax=docker/dockerfile:1

FROM ubuntu:latest
WORKDIR /
SHELL ["/bin/bash", "-c"]
RUN apt update
RUN apt install curl nano nginx -y
RUN curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.5/install.sh | bash
RUN . ~/.nvm/nvm.sh && nvm install --lts && npm update -g && npm i rimraf pm2 bun -g
COPY environments/nginx/conf.d/ /etc/nginx/conf.d/
RUN mkdir ~/projects
COPY bun-express-quickstart /root/projects/bun-express-quickstart
RUN . ~/.nvm/nvm.sh && cd ~/projects/bun-express-quickstart && bun install --force
COPY start.sh /root/projects
ENTRYPOINT ["/bin/bash", "-c", "bash ~/projects/start.sh && /bin/bash"]
EXPOSE 22 3000 8080 8443
