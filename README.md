# python-helloworld-http
python-helloworld-http

Go to killer kota and create fresh ubuntu environment
https://killercoda.com/playgrounds/scenario/ubuntu

Clone the repo
git clone https://github.com/dogruyurek/python-helloworld-http.git

Run the preparation job
bash python-helloworld-http/prepare_jenkins.sh

Configre jenkins pipeline to perform following tasks

build : build docker image
test : run docker image and verify that http server is up/running
push : tag image and push image to github

github credential will be provided
this repo is publicly available
