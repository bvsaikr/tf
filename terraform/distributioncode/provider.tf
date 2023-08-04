provider "aws" {
    region = "ap-south-1"
    profile = "default"
}
provider "google" {
  project     = "my-project-id"
  region      = "us-central1"
}