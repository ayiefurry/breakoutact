#!/bin/bash

mkdir tempdir
mkdir tempdir/templates


cp ipflask.py tempdir/.
cp -r templates/* tempdir/templates/.


echo "FROM python" > tempdir/Dockerfile
echo "RUN pip install flask" >> tempdir/Dockerfile
echo "RUN pip install ipapi" >> tempdir/Dockerfile
echo "COPY  ./templates /home/myapp/templates/" >> tempdir/Dockerfile
echo "COPY  ipflask.py /home/myapp/" >> tempdir/Dockerfile
echo "EXPOSE 8080" >> tempdir/Dockerfile
echo "CMD python3 /home/myapp/ipflask.py" >> tempdir/Dockerfile

cd tempdir
docker build -t projectapp .
docker run -t -d -p 8080:8080 --name projectrunning projectapp
docker ps -a