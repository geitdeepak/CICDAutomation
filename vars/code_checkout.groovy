def call(String gitUrl, String branch, String credentialsId) {
    if (!gitUrl) {
        error "Git URL is required"
    }
    if (!branch) {
        branch = 'main' 
    }

    git url: "${gitUrl}", branch: "${branch}", credentialsId: "${credentialsId}"
}
//  code_checkout("https://github.com/dsumanta/AI-Project-Management.git","dev","github")