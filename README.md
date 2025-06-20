# terraform_setups

This repository serves to store different deployment setups using terraform

# Prerequisite

- You need to have gcloud cli installed

- You need to be authenticated to gcloud cli

- A google service account is required wether it be the default account, one created manually, or a user that has access to the project. It is preferable to create a new service account and give it authority according to its role/scope.

- You need terraform on your local machine if you want to run any of these deployments locally. If they are ran on a deployment CI make sure that environment has terraform installed

- Different setups may require you to enable specific google api on your google cloud project
