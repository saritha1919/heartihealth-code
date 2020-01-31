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
						 bat label: '', script: 'mvn clean verify sonar:sonar'
					  //bat label: '', script: 'mvn org.sonarsource.scanner.maven:sonar-maven-plugin:3.2:sonar'
                                         //powershell 'mvn org.sonarsource.scanner.maven:sonar-maven-plugin:3.2:sonar'
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
