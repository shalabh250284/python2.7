pipeline {
    agent none
    options { 
		buildDiscarder(logRotator(numToKeepStr: '10')) 
		disableConcurrentBuilds()
		timeout(time: 1, unit: 'HOURS')
    } 
    stages {
        stage('Build Docker Image') {
			agent { label 'master' }
			steps {
				script {
					//sh 'docker build -t shalabh250284/python-jnlp:1.0.1 .'
					def image = docker.build('shalabh250284/python-jnlp:1.0.1')
					image.push()
					
				}
            }
        }
    }
}
