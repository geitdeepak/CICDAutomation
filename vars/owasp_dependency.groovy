def call() {
    dependencyCheck additionalArguments: '-scan ./', odcInstallation: 'owasp'
    dependencyCheckPublisher pattern: '**/dependency-check-report.xml'
}
