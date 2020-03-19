#!/bin/sh
cd ide_idea
./build.sh
cd ../novnc
./build.sh
cd ..

docker-compose up -d
if [ $? -ne 0 ]; then
	curl -L https://github.com/docker/compose/releases/download/1.24.1/docker-compose-`uname -s`-`uname -m` > ./docker-compose
	chmod +x ./docker-compose
	./docker-compose up -d
	if [ $? -ne 0 ]; then
		echo "failed"
	else
		echo "succeed"
	fi
else
	echo "succeed"
fi
