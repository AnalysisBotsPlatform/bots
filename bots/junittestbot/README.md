JUnit Test Bot

The JUnit Test Bot can be transferred into a docker image by simply running:
	docker build -t <yournamespace/projectname> .

The docker image is also available on DockerHub as:
	rebecca93/junittestbot


The docker image expects as a first argument the path of the project to run the bot on.

It also expects the tests to be executed located under:
	/src/test/

The bot comes with the Oracle JDK 1.8.0_72 and with JUnit 4.12 as well was Hamcrest 1.3.
