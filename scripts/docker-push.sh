#!/bin/sh

if [ -z "$TRAVIS_PULL_REQUEST" ] || [ "$TRAVIS_PULL_REQUEST" == "false" ]
then
  if [ "$TRAVIS_BRANCH" == "staging" ] || [ "$TRAVIS_BRANCH" == "production" ]
  then
    curl "https://s3.amazonaws.com/aws-cli/awscli-bundle.zip" -o "awscli-bundle.zip"

    unzip awscli-bundle.zip
    ./awscli-bundle/install -b ~/bin/aws
    export PATH=~/bin:$PATH
    eval $(aws ecr get-login --region us-east-1 --no-include-email)
    export TAG=$TRAVIS_BRANCH
    export REPO=$AWS_ACCOUNT_ID.dkr.ecr.us-east-1.amazonaws.com
  fi

  if [ "$TRAVIS_BRANCH" == "staging" ]
  then
    export REACT_APP_EVENTS_SERVICE_URL="http://my-dev-space-staging-alb-2128504978.us-east-1.elb.amazonaws.com"
    export REACT_APP_GOOGLE_ANALYTICS_ID="UA-123052755-2"
    export SECRET_KEY="$STAGING_SECRET_KEY"
    export NEW_RELIC_LICENSE_KEY="$NEW_RELIC_LICENSE_KEY"
  fi

  if [ "$TRAVIS_BRANCH" == "production" ]
  then
    export REACT_APP_EVENTS_SERVICE_URL="https://muxer.co.uk"
    export REACT_APP_GOOGLE_ANALYTICS_ID="UA-123052755-3"
    export SECRET_KEY="$PRODUCTION_SECRET_KEY"
    export NEW_RELIC_LICENSE_KEY="$NEW_RELIC_LICENSE_KEY"
  fi

  if [ "$TRAVIS_BRANCH" == "staging" ] || [ "$TRAVIS_BRANCH" == "production" ]
  then

    echo "Building: ${CLIENT_DIR} for ${CLIENT}:${COMMIT} to push ${REPO}/${CLIENT}/${TAG}"
    cd $CLIENT_DIR
    docker build -t $CLIENT:$COMMIT -f Dockerfile-$DOCKER_ENV --build-arg REACT_APP_EVENTS_SERVICE_URL=$REACT_APP_EVENTS_SERVICE_URL --build-arg REACT_APP_GOOGLE_ANALYTICS_ID=$REACT_APP_GOOGLE_ANALYTICS_ID .
    docker tag $CLIENT:$COMMIT $REPO/$CLIENT:$TAG
    docker push $REPO/$CLIENT:$TAG
    cd ../../
  fi
fi
