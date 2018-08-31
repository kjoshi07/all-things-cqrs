# All Things CQRS

A bunch of ways of doing [CQRS](https://martinfowler.com/bliki/CQRS.html) with various [Spring](https://spring.io) tools.

## Getting Started

These instructions will get you and overview of how to apply CQRS. Each module represents a different way of introducing this pattern. Also, each module is a standalone [Spring Boot](https://spring.io/projects/spring-boot) application. 

### Prerequisites

What things you need to run the software:

* Java 8+
* [docker-compose](https://docs.docker.com/compose/)

## Overview

Sample applications are based on a simple domain that serves credit cards. There are two usecases:

*  Money can be withdrawn from a card (*Withdraw* **command**)
*  List of withdrawals from a card can be read (**query**)

The imporant is that:
```
After a successful Withdraw command, a withdrawal should be seen in a result from list of withdrawals query.
```

Hence there is a need for some **synchronization** that makes state for commands and queries consistent.

Let's agree on a color code for commands, queries and synchronization. It will make our drawings consistent.

![color code](https://github.com/ddd-by-examples/all-things-cqrs/blob/master/colorcode.jpg "Color code")

### Commands and queries handled in one class (no CQRS)

Code can be found under [in-one-class](https://github.com/ddd-by-examples/all-things-cqrs/tree/master/in-one-class) module. 

Running the app:
```
mvn spring-boot:run
```

A sample *Withdraw* command:

```
curl localhost:8080/withdrawals -X POST --header 'Content-Type: application/json' -d '{"card":"3a3e99f0-5ad9-47fa-961d-d75fab32ef0e", "amount": 10.00}' --verbose
```
Verifed by a query:
```
curl http://localhost:8080/withdrawals?cardId=3a3e99f0-5ad9-47fa-961d-d75fab32ef0e --verbose
```
Expected result:
```
[{"amount":10.00}]
```

Architecture overview:

[in-one-class](https://github.com/ddd-by-examples/all-things-cqrs/blob/master/inoneclass.jpg) 

### Commands and queries handled in one class (no CQRS)


### Break down into end to end tests

Explain what these tests test and why

```
Give an example
```

### And coding style tests

Explain what these tests test and why

```
Give an example
```

## Deployment

Add additional notes about how to deploy this on a live system

## Built With

* [Dropwizard](http://www.dropwizard.io/1.0.2/docs/) - The web framework used
* [Maven](https://maven.apache.org/) - Dependency Management
* [ROME](https://rometools.github.io/rome/) - Used to generate RSS Feeds

## Contributing

Please read [CONTRIBUTING.md](https://gist.github.com/PurpleBooth/b24679402957c63ec426) for details on our code of conduct, and the process for submitting pull requests to us.

## Versioning

We use [SemVer](http://semver.org/) for versioning. For the versions available, see the [tags on this repository](https://github.com/your/project/tags). 

## Authors

* **Billie Thompson** - *Initial work* - [PurpleBooth](https://github.com/PurpleBooth)

See also the list of [contributors](https://github.com/your/project/contributors) who participated in this project.

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details

## Acknowledgments

* Hat tip to anyone whose code was used
* Inspiration
* etc
