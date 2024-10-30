docker build . -t server
docker run -it --rm -p 419:31337 server
