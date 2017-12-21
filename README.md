## Goal
A portable container that contains build tools for building code on local environments without requiring tools on your local machine. Also useful as a docker base container for CI builds

## Languages
Java NodeJs

## Tools
Git, Vim, curl, jq, aws-cli, docker, docker-compose, maven, npm, gulp, bower

## Examples
### maven example
`docker run --rm -it -v $(pwd):/code  -v $HOME/.m2:/root/.m2 -w /code rickshawhobo/code-builder mvn clean compile assembly:single`

### docker in docker example
`docker run --rm -it -v $(pwd):/code  -v /var/run/docker.sock:/var/run/docker.sock2 -w /code rickshawhobo/code-builder docker build -t tag .`

