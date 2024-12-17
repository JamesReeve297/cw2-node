pipeline { 
    agent any 

    environment { 
        DOCKER_IMAGE = "jamesk297/cw2-server:latest" // DockerHub image name 
    } 

    stages { 
        stage('Checkout Code') { 
            steps { 
                echo "Cloning the repository..." 
                git branch: 'master', credentialsId: 'github-ssh-key', url: 'git@github.com:JamesReeve297/cw2-node.git' 
            } 
        } 

        stage('Build Docker Image') { 
            steps { 
                echo "Building Docker image..." 
                sh "docker build -t ${DOCKER_IMAGE} ." 
            } 
        } 

        stage('Push Docker Image') { 
            steps { 
                echo "Pushing Docker image to DockerHub..." 
                withCredentials([usernamePassword(credentialsId: 'dockerhub-creds', usernameVariable: 'DOCKER_USER', passwordVariable: 'DOCKER_PASS')]) { 
                    sh "echo ${DOCKER_PASS} | docker login -u ${DOCKER_USER} --password-stdin" 
                    sh "docker push ${DOCKER_IMAGE}" 
                } 
            } 
        } 
    } 

    post { 
        success { 
            echo "Pipeline completed successfully!" 
        } 
        failure { 
            echo "Pipeline failed. Check logs for details." 
        } 
    } 
}
