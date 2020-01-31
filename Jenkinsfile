pipeline {
         agent any
             stages {
	          
                 stage('Source') {
                    steps {
                       checkout([$class: 'GitSCM', branches: [[name: '*/master']], doGenerateSubmoduleConfigurations: false, extensions: [], submoduleCfg: [], userRemoteConfigs: [[url:'https://github.com/saritha1919/heartihealth-code.git']]])
	            }        
                 }
                  stage('ServiceBuild') {
                    tools{
                      jdk 'jdk8'
                      maven 'Maven'
                    }
                            steps { 
                              script{
                                bat label: '', script: 'mvn install'
				 bat label: '', script: 'mvn clean package'
                               }
                           }
		  }
		     stage('Archiving Artifacts') { 
                         steps{ 
                             archiveArtifacts 'discoveri-heartihealth-webapp/target/*.jar' 
                         } 
                 } 
		     stage('Sonar Qube analysis') {
			steps{
				script{
				         withSonarQubeEnv('SonarQube') {
						 bat label: '', script: '"C:/Program Files/apache-maven-3.6.3/bin/"mvn clean verify sonar:sonar'
					 }
                                   }
			}
		}
                   stage('CreateService'){
		       steps{
                           script{
                              bat "CreateService.bat"
		           }
                       }
		   }
	}
}
