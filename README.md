<p align="center"> Laravel + PHP7 + MySql + Docker. </p>
<p align="center">Use this repository to get started with developing your Laravel application in a Docker container.</p>

## Pre-requisites

- Docker running on the host machine.
- Basic knowledge of Docker.

## Versions:
- PHP ^7.2
- MySQL ^5.7

## Getting Started

To get started, the following steps needs to be taken:

- Clone the repository
- Run `make rebuild`
- Visit **localhost:12100** to see your Laravel application.


## Makefile
The Makefile provides few convenient and useful commands:
- `make rebuild` : Rebuild the containers
- `make down` : Down all the containers
- `make restart` : Restart the containers
- `make status` : Show the status of the containers
- `make shell` : Run an interactive shell with the php container
- `make logs` : Listen logs on all the containers
- `make prune` : Remove all unused images not just dangling ones + Prune volumes
- `make mysql` : Run an interactive shell with the mysql  container
