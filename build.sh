#!/bin/bash
cd vote
docker build -t prabhavagrawal/vote-app .
cd ..
cd result
docker build -t prabhavagrawal/result-app .
cd ..
cd worker
docker build -t prabhavagrawal/worker-app .

#Remove containers if any
docker rm -f redis db vote result worker

docker run -d --name=redis redis
docker run -d --name=db -e POSTGRES_HOST_AUTH_METHOD=trust postgres:9.4
docker run -d --name=vote -p 5000:80 --link redis:redis prabhavagrawal/vote-app
docker run -d --name=result -p 5001:80 --link redis:redis --link db:db prabhavagrawal/result-app
docker run -d --name=worker --link redis:redis --link db:db prabhavagrawal/worker-app
