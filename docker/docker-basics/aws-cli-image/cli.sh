## https://aws.amazon.com/blogs/developer/aws-cli-v2-docker-image/
## Start a shell locally using the dockerhub cli image
docker run --rm -it -v ~/.aws:/root/.aws --entrypoint sh amazon/aws-cli

## Pin the version on your machine and alias it as the CLI command
alias aws='docker run --rm -ti -v ~/.aws:/root/.aws -v $(pwd):/aws amazon/aws-cli:2.0.6''

