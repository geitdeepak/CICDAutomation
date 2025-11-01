def call(String gitUrl, String branch) {
    if (!gitUrl) {
        error "Git URL is required"
    }
    if (!branch) {
        branch = 'main' 
    }

    git url: "${gitUrl}", branch: "${branch}"
}
