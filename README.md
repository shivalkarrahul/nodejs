Sample NodeJs Application
=========================

Overview
--------

CI/CD to test, build, push and deploy the NodeJS Dokerized app to AWS ECS using Jenkins Declarative Pipeline.

Tech Stack
----------

Github
This contains our sample nodes application code.

Jenkins
Jenkins declarative pipeline that is triggered on every commit.

ECR
Docker images will be stored in AWS ECR.

ECS
Aplication will be deployed in AWS ECS.

Pipeline Stages
---------------

Tests

Build an image

Push the image to ECR

Deploy the image

Notes
-----

New line
