pipeline {
  agent any

  parameters {
    choice(name: 'ENV', choices: ['', 'dev', 'prod'], description: 'Pick Env')
  }

  stages {

    stage('Terraform Apply') {
      steps {
        sh '''
          terraform init -backend-config=env/${ENV}-backend.tfvars
          #terraform apply -auto-approve -var-file=env/${ENV}.tfvars
        '''
      }
    }

  }

}
