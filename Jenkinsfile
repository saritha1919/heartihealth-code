pipeline {
         agent any
             stages {
	    
                 stage('Source') {
                    steps {
                       checkout([$class: 'GitSCM', branches: [[name: '*/master']], doGenerateSubmoduleConfigurations: false, extensions: [], submoduleCfg: [], userRemoteConfigs: [[url:'https://github.com/saritha1919/heartihealth-code.git']]])
	            }        
                 }
                  stage('Build') {
                    tools{
                      jdk 'jdk8'
                      maven 'Maven'
                    }
                            steps { 
                              script{
                                bat label: '', script: 'mvn install'
                                bat label: '', script: 'mvn spring-boot:run -pl discoveri-heartihealth-webapp'
                               }
                            }
                  }
                   stage('Deployment'){
		       steps{
                           script{
				   dir('discoveri-heartihealth-webapp\\target')
				   {
					   set BUILD_ID=dontKillMe
					 
                                          // powershell -Command "Start-Process 'RunService.bat'"
					   bat  'javaw -jar discoveri-heartihealth-webapp-0.0.1-SNAPSHOT.jar'
					     BUILD ID URL/stop
					   echo 'After deployment'
				   }
                             //bat "RunService.bat"
		           }
                    }
		}
	}
}
