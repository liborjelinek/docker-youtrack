# JetBrains YouTrack dockerized

Just [YouTrack](https://www.jetbrains.com/youtrack/), amazing issue tracker from folks at JetBrains, but dockerized.

Current dockerized YouTrack version is 2017.1.31322. This is available both as "bircow/youtrack:latest" or "bircow/youtrack:2017.1.31322".

## Running

To run and enjoy you must only config two things:

* network port on your computer
* folder to store YouTrack database

In the following example YouTrack will run on http://localhost:8808 (via `-p`) and store its database in `~/Drive/backups/youtrack` (via `-v`). In the words of commandline:

    docker run -d --rm \
        -p 8808:8080 \
        -v ~/Drive/backups/youtrack:/youtrack/db \
        --name youtrack \
        bircow/youtrack

If you already have YouTrack DB, point to this folder.

For your convenience, there is also `run.sh` script that runs YouTrack too. Create `config` in the same directory as `run.sh` with content like this:

    PORT=8808
    DB=~/Drive/backups/youtrack

And `./run.sh` to enjoy.

## Building

To build different version of YouTrack, pass it as build ARG:
 
    docker build -t my-youtrack --build-arg "YOUTRACK_VER=someversion" .

There are also `build*.sh` scripts that I use to save some typing on commandline to build, push, and run. 