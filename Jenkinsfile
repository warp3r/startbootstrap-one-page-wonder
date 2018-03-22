pipeline {
  agent any
  
  triggers {
	pollSCM('* * * * *')
  }


  stages {
	stage("docker build") {
		steps {
			sh "docker build -t miaplicacion:${GIT_COMMIT} ."
		}
	}

	stage("docker stop") {
		steps {
			sh "current_docker=\$(docker ps | grep miaplicacion | awk '{ print \$1 }') ;; docker stop \${current_docker} ;; exit 0"
		}
	}
	
	stage("docker start") {
		steps {
			sh "docker run -d -p 80:80 miaplicacion:${GIT_COMMIT}"
		}
	}
  }
}
