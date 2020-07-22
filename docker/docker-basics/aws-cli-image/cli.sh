## https://aws.amazon.com/blogs/developer/aws-cli-v2-docker-image/
## Start a shell locally using the dockerhub cli image
docker run --rm -it -v ~/.aws:/root/.aws --entrypoint sh amazon/aws-cli

## Pin the version on your machine and alias it as the CLI command
alias aws='docker run --rm -ti -v ~/.aws:/root/.aws -v $(pwd):/aws amazon/aws-cli:2.0.6'

## Pin the version and leverage env vars (Not file)
alias aws='docker run --rm -ti -e AWS_ACCESS_KEY_ID=$AWS_ACCESS_KEY_ID -e AWS_SECRET_ACCESS_KEY=$AWS_SECRET_ACCESS_KEY -e AWS_SESSION_TOKEN=$AWS_SESSION_TOKEN -e AWS_DEFAULT_REGION=$AWS_DEFAULT_REGION -v ~/.aws:/root/.aws -v $(pwd):/aws amazon/aws-cli:2.0.6
