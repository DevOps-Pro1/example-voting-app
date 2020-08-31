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
    

    
       stage('SonarQube Code analysis') {
    steps{script{
        def scannerHome = tool 'sonar';
    withSonarQubeEnv('sonar') { // If you have configured more than one global server connection, you can specify its name
      sh "${scannerHome}/bin/sonar-scanner"
    }
  }
}
}
     
    
   /* stage('Ansible Init') {
            steps {
                script {
                
               def tfHome = tool name: 'ansible'
                env.PATH = "${tfHome}:${env.PATH}"
                 sh 'ansible --version'
                    
            }
            }
        } */


        stage('Deploy') {
            steps {
                echo 'Deploying the application ...'
                 ansiblePlaybook(
                        credentialsId: 'ssh-key',
                        inventory: 'inventory.txt',
                        playbook: 'ansible-playbook.yml',
                        disableHostKeyChecking: true,
                        colorized: true
                  )
                  
                /*ansiblePlaybook installation: 'ansible', 
                inventory: 'inventory.txt', 
                playbook: 'ansible-playbook.yml',
                credentialsId: 'ssh-key',
                disableHostKeyChecking: true,
                colorized: true*/
            }
        }
    
}


 
}
   
