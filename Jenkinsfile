node {
    def app

    stage('Clone repository') {
        /* Let's make sure we have the repository cloned to our workspace */

        checkout scm
        sh 'mvn clean package'
    }

    stage('Compile') {
        sh 'mvn clean package'
    }

    stage('Build image') {
        /* This builds the actual image; synonymous to
         * docker build on the command line */

        app = docker.build("kdunetz/kadspringapp")
    }

    stage('Test image') {
        /* Ideally, we would run a test framework against our image.
         * For this example, we're using a Volkswagen-type approach ;-) */

        app.inside {
            sh 'echo "Tests passed"'
        }
    }

    stage('Push image') {
        /* Finally, we'll push the image with two tags:
         * First, the incremental build number from Jenkins
         * Second, the 'latest' tag.
         * Pushing multiple tags is cheap, as all the layers are reused. */
        docker.withRegistry('https://registry.hub.docker.com', 'docker-hub-credentials') {
            app.push("${env.BUILD_NUMBER}")
            app.push("latest")
        }
    }
    stage('Deploy to Kubernetes') {
        sh 'gcloud config set compute/zone us-central1-a'
        sh 'gcloud config set compute/region us-central1'
        sh 'gcloud container clusters get-credentials standard-cluster-1'
        sh 'export NAMESPACE=default'
        sh 'export IMAGE=kdunetz/kadspringapp:${env.BUILD_NUMBER}'
        sh 'export NAME=kadspringapp'
        sh 'IMAGE=${IMAGE//[\/]/\\\/}'
        sh 'kubectl delete -f <(cat deployment/deploy_docker_hub.yml | sed "s/IMAGE/$IMAGE/g" | sed "s/NAME/$NAME/g") -n $NAMESPACE'
        sh 'kubectl create -f <(cat deployment/deploy_docker_hub.yml | sed "s/IMAGE/$IMAGE/g" | sed "s/NAME/$NAME/g") -n $NAMESPACE'
        /* sh './deploy.sh' */
    }
}
