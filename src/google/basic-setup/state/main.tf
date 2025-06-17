#This terraform state setup is to initialize the backend file with the correct bucket name and directory prefix
#This is done because terraform backend block is processed before variables are processed therefore we need to create it with static values or pass them during the init command
#This requires you to init and apply the state first then the main setup that is in the parent directory of the state
resource "local_file" "default" {
  file_permission = "0644"
  filename        = "../backend.tf"

  content = <<-EOT
  terraform {
    backend "gcs" {
      bucket = "${var.STORAGE_NAME}"
      prefix = "${var.ENV}/"
    }
  }
  EOT
}

### Information

#bucket = "${var.STORAGE_NAME}"
#This is the name of the bucket where you want to store your state

#prefix = "${var.ENV}/"
#This is the directory path to the state file. You do not need to provide the file name just the directory path
