inspect() {
  if [ $1 -ne 0 ]; then
    fails="${fails} $2"
  fi
}

set -x

docker-compose -f docker-compose-dev.yml build client-test
docker-compose -f docker-compose-dev.yml run client-test npm run lint
inspect $? client-lint
CI=true docker-compose -f docker-compose-dev.yml run client-test npm test -- --coverage
inspect $? client-test

set +x

if [ -n "${fails}" ]; then
  echo "Tests failed: ${fails}"
  exit 1
else
  echo "Tests passed!"
  exit 0
fi
