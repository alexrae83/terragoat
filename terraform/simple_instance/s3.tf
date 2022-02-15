provider "aws" {
  region = "us-west-2"
}

resource "aws_s3_bucket" "docking_bay" {
  bucket_prefix = "docking-bay-storage-"

  tags = {
    Name                 = "Docking Bay"
    Environment          = "Dev"
    git_commit           = "ba819faab8912e5a7a801ac78983332d67f5e8fe"
    git_file             = "terraform/simple_instance/s3.tf"
    git_last_modified_at = "2022-02-15 20:44:01"
    git_last_modified_by = "alexrae83@gmail.com"
    git_modifiers        = "alexrae83"
    git_org              = "alexrae83"
    git_repo             = "terragoat"
    yor_trace            = "9b47228a-fa8a-4f25-af2a-853813f41133"
  }
}
