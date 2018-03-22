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
			sh "docker ps | grep miaplicacion | awk '{ print \$1 }' | xargs -n 1 docker stop || exit 0"
		}
	}
	
	stage("docker start") {
		steps {
			sh "docker run -d -p 80:80 miaplicacion:${GIT_COMMIT}"
		}
	}
	  
	  stage("smoke test") {
		  sh "inspec test.rb"
	  }
	  
  }
}
