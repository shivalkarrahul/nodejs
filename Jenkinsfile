pipeline {
    agent any
    environment {
      AWS_ACCOUNT_ID="767657561355"
      AWS_DEFAULT_REGION="eu-central-1" 
      CLUSTER_NAME="project3"
      SERVICE_NAME="project3-nodejs-container-service"
      TASK_DEFINITION_NAME="first-run-task-definition"
      DESIRED_COUNT="1"
      IMAGE_REPO_NAME="capstone_project3_ecr_repository"
      IMAGE_TAG="${env.BUILD_ID}"
      REPOSITORY_URI="${AWS_ACCOUNT_ID}.dkr.ecr.${AWS_DEFAULT_REGION}.amazonaws.com/${IMAGE_REPO_NAME}"
      registryCredential="aws-iam-user"
    }
   
    stages {

    // Tests
    stage('Unit Tests') {
      steps{
        script {
          sh 'npm install'
	        sh 'npm test -- --watchAll=false'
        }
      }
    }
        
    // Building Docker images
    stage('Building image') {
      steps{
        script {
          dockerImage = docker.build "${IMAGE_REPO_NAME}:${IMAGE_TAG}"
        }
      }
    }
   
    // Uploading Docker images into AWS ECR
    stage('Pushing to ECR') {
      steps{
        script {
			    docker.withRegistry("https://" + REPOSITORY_URI, "ecr:${AWS_DEFAULT_REGION}:" + registryCredential) {
            dockerImage.push()
          }
        }
      }
    }

    stage('Deploy') {
      steps{
        withAWS(credentials: registryCredential, region: "${AWS_DEFAULT_REGION}") {
          script {
			      './script.sh'
          }
        }
      }
    }
  }
}
