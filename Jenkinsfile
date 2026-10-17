pipeline {
    agent any

    environment {
        STUDENT_NAME    = 'Ulpan'
        STUDENT_SURNAME = 'Saparbek'
        STUDENT_GROUP   = 'IT2-2310'
        STUDENT_ID      = '37615'
        IMAGE_NAME      = 'saparbek-ulpan-devops'
        CONTAINER_NAME  = 'saparbek-ulpan-container'
    }

    stages {
        stage('Checkout') {
            steps {
                checkout scm
                sh 'git log -1 --oneline'
            }
        }

        stage('Build') {
            steps {
                echo "Student: ${STUDENT_NAME} ${STUDENT_SURNAME}"
                echo "Group: ${STUDENT_GROUP}"
                echo "Student ID: ${STUDENT_ID}"
                sh 'python3 -m py_compile app/app.py'
                sh 'bash -n scripts/Saparbek_Ulpan_system.sh'
            }
        }

        stage('Test') {
            steps {
                sh 'test -f Saparbek_Ulpan_info.txt'
                sh 'test -f Dockerfile'
                sh 'python3 app/app.py | grep "Name: $STUDENT_NAME"'
                sh 'bash scripts/Saparbek_Ulpan_system.sh'
            }
        }

        stage('Docker Build') {
            steps {
                sh 'docker build -t $IMAGE_NAME .'
                sh 'docker images $IMAGE_NAME'
            }
        }

        stage('Docker Run') {
            steps {
                sh 'docker rm -f $CONTAINER_NAME || true'
                sh '''docker run --name $CONTAINER_NAME \
                      -e STUDENT_NAME=$STUDENT_NAME \
                      -e STUDENT_SURNAME=$STUDENT_SURNAME \
                      -e STUDENT_GROUP=$STUDENT_GROUP \
                      -e STUDENT_ID=$STUDENT_ID \
                      $IMAGE_NAME'''
                sh 'docker ps -a --filter name=$CONTAINER_NAME'
            }
        }
    }

    post {
        success { echo 'Pipeline finished successfully.' }
        failure { echo 'Pipeline failed. Check the stage logs above.' }
    }
}
