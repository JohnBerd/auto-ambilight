Download the modified prismatic version
Modify it to always match with the ttyUSB to connect with and rebuild it
Move the built program in /usr/local/bin and call it prismatic

sudo cp Prismatik /usr/local/bin/prismatik

Create a rule in /etc/udev/rules.d

ATTRS{idVendor}=="1a86", ATTRS{idProduct}=="7523", ACTION=="add", RUN+="service led start"

Create the led service called led.service in /etc/systemd/system

[Unit]
Description=Screen led controller
After=network.target
startLimidIntervalSec=0

[Service]
Type=simple
Restart=always
RestartSec=1
User=root
ExecStart=su - xavier -c 'export DISPLAY=:0;export XDG_RUNTIME_DIR=/run/user/1000; prismatik'

[Install]
WantedBy=multi-user.target
