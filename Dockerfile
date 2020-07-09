FROM node:12

RUN apt-get update
RUN apt-get install -y libcap2-bin python

RUN setcap 'cap_net_bind_service=+ep' /usr/local/bin/node

RUN useradd -ms /bin/bash newuser
USER newuser
run mkdir -p /home/newuser/src/app
WORKDIR /home/newuser/src/app

COPY package*.json ./
RUN npm install

COPY . .

EXPOSE 80

CMD [ "/usr/local/bin/node", "server/app.js" ]
