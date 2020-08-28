pipeline{
    agent any
    tools{
       maven 'maven'
    }
    stages{
        stage("Check out"){
        steps{
            git "https://github.com/DevOps-Pro1/example-voting-app.git"
            echo "Checking out code"
        }
        }
      stage("Docker"){
          steps{
       sh 'docker --version' 
        }
    }
     stage("build"){
         steps{
         sh 'chmod +x build.sh'
         sh './build.sh'
         }
     }   
     
     
          stage("SonarQube analysis") {
           
            steps {
              withSonarQubeEnv('sonar') {
                sh 'mvn clean package -f */pom.xml sonar:sonar'
              }
            }
          
        
    }
     
     
        }
        
      
        
}
   
