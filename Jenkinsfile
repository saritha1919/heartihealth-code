pipeline {
         agent any
             stages {
	    
                 stage('Source') {
                    steps {
                       checkout([$class: 'GitSCM', branches: [[name: '*/master']], doGenerateSubmoduleConfigurations: false, extensions: [], submoduleCfg: [], userRemoteConfigs: [[url:'https://komalsahu@dev.azure.com/komalsahu/SkillAssure%20Discoveri/_git/HeartiHealth-Services']]])
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
                                bat label: '', script: 'jave -jar discoveri-heartihealth-webapp-0.0.1-SNAPSHOT'
			      }
		           }
                    }
		}
	}
}
