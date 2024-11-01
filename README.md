# Tasteless Shores Challenges

This is a reproduction repo for running the Tasteless Shores Game challenge set.

## Usage

### Dedicated Server
First have `docker` installsed on your machine.
Then run:
```
./start_challenge.sh
```

This will both build the Docker image (Ubuntu 22.04), and start running the server.
The game is now accessible on port 28. 
You can change it in the start challenge script.

### Client
To connect with the client, simply run the binary in the same directory as `tasteless-shores.pck`
Like so:
```
./tasteless-shores.x86_64 client
```


