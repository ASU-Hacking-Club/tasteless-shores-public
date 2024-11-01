docker build . -t server
docker run -it --rm -p 29:31337 server
