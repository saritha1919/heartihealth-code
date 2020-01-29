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
                               // bat label: '', script: 'mvn spring-boot:run -pl discoveri-heartihealth-webapp'
				 bat label: '', script: 'mvn clean package'     
                               }
                            }
                  }
                   stage('Deployment'){
		       steps{
                           script{
				   //dir('discoveri-heartihealth-webapp\\target')
				   //{
					   
                                           bat label: '', script: 'runas /user:PT-RND-001\\Saritha "WinSW.NET4.exe install" < password@123'
					   //bat  'javaw -jar discoveri-heartihealth-webapp-0.0.1-SNAPSHOT.jar &'
					//   echo 'After deployment'
				   //}
				 // bat "runas /savecred /user:ng1\\administrator RunService.bat"
                            //bat "RunService.bat"
				   echo "completed"
		           }
                    }
		}
	}
}
