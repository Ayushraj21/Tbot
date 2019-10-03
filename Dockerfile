FROM baalajimaestro/userbot_python:latest

ENV PATH="/app/bin:$PATH"
WORKDIR /app

# Copy Python Requirements to /app

RUN  sed -e 's;^# \(%wheel.*NOPASSWD.*\);\1;g' -i /etc/sudoers
RUN adduser userbot --disabled-password --home /home/userbot
RUN adduser userbot wheel
USER userbot
RUN mkdir /home/userbot/userbot
RUN git clone -b staging https://github.com/Ayushraj21/Tbot /home/userbot/userbot
WORKDIR /home/userbot/userbot

#
# Copies session and config(if it exists)
#
COPY ./client_secrets.json* ./secret.json* /app/

#
# Install requirements
#
CMD ["bash","init/start.sh"]


