Muxer
=====

[![Build Status](https://travis-ci.com/apoclyps/my-dev-space.svg?token=putHnyd9Fyt2bwsGacCD&branch=production)](https://travis-ci.com/apoclyps/my-dev-space?token=putHnyd9Fyt2bwsGacCD&branch=production)[![GitHub license](https://img.shields.io/github/license/Naereen/StrapDown.js.svg)](https://github.com/Naereen/StrapDown.js/blob/master/LICENSE)[![PRs Welcome](https://img.shields.io/badge/PRs-welcome-green.svg)](http://makeapullrequest.com) ![Code of Conduct](https://img.shields.io/badge/%E2%88%9A-Code%20of%20Conduct-blue.svg)

> The front end service for My Dev Space, an open source developer community to promote local hackathons, conferences, and meetups, mentoring, calls for speakers, and collaboration.

Getting Started
---------------

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes. See deployment for notes on how to deploy the project on a live system.

### Prerequisites

What things you need to install the software (latest versions) and how to install them

-	[Docker](https://docs.docker.com/install/) - Used to build, ship, and run all services
-	[Node](https://nodejs.org/en/) - Used to create a UI via React, manage frontend dependencies

## Project Structure
The majority of code for this project is located in the `src` folder. From there, the `pages` folder contains React components which are responsible for rendering out full pages. The `components` folder contains more React components, these are consumed by the Page components. The `reducers`, `selectors` and `store` directories contain code responsible for state management. This app relies on [Redux](https://redux.js.org/) for state management. Finally, the `utils` directory contains useful helper functions.

### Quick Start

The following steps are required for first time setup. These steps will check out the repository, install the project dependencies, and the client dependencies needed for the React frontend and run the service on `http://localhost`. *Note* `http://localhost` will show a gateway error until the client has completed building (typically 1 minute for first time setup).

> If you are using https://muxer.co.uk for loading events, you will need to install a [CORS Chrome extension](https://chrome.google.com/webstore/detail/allow-control-allow-origi/nlfbmbojpeacfghkpbjhddihlkkiljbi?hl=en)

```bash
git clone https://github.com/muxer-dev/muxer-client
cd muxer-client
npm install react-scripts -g
npm install react-app-rewired -g
npm install
docker-compose -f docker-compose-dev.yml up
```

And to tear down the local development stack, simply run:

```bash
docker-compose -f docker-compose-dev.yml down
```

## Setting up a local development environment:

Before you can work on this service, you will need to ensure that you have [Docker](https://www.docker.com/) installed on your machine.

#### Install Dependencies

``` bash
docker-compose -f docker-compose-dev.yml run client npm install
```


#### Start the Dev Server

``` bash
docker-compose -f docker-compose-dev.yml run client npm start
```


#### Build the app

``` bash
docker-compose -f docker-compose-dev.yml run client npm run build
```

#### Run tests

``` bash
docker-compose -f docker-compose-dev.yml run client npm run test
```


#### Lint code

``` bash
docker-compose -f docker-compose-dev.yml run client npm run lint
```

### Deployment

Deployments to the staging and production environments require a PR to be opened against the staging/production branches; Upon successfully merging a PR into either branch; Travis CI will build, run, test, and deploy the changes to AWS ECS.

### Built With

-	[React](http://www.dropwizard.io/1.0.2/docs/) - Javascript client framework
-	[Flask](https://maven.apache.org/) - Python web framework
-	[Postgres](https://www.postgresql.org/) - Relational Database Management System
-	[Docker](https://rometools.github.io/rome/) - Build, run, and deploy services
-	[Swagger](https://swagger.io/) - Generate API documentation
-	[Nginx](https://www.nginx.com/) - high-performance HTTP server, reverse proxy

### License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details

### Contributing

Please read [CONTRIBUTING.md](CONTRIBUTING.md) for details on our code of conduct, and the process for submitting pull requests to us.
