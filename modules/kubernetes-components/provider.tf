provider "kubernetes" {
  config_path = "~/.kube/config"
  config_context = "scaleway" 
}

provider "helm" {
  kubernetes {
    config_path = "~/.kube/config"
    config_context = "scaleway" 
  }
}

