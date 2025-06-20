# Basic setup

This contains a setup for using terraform to do a full kubernetes deployment on google kubernetes engine.
This setup includes cluster creation, node creation, deployment creation, service creation and more.
The intent for this setup is to purely use terraform for infrastructure setup and continuous deployment.

# Pre-requisite

Enable the google cloud kubernetes engine
Create an IAM service account with the proper rights

# Information

If you need to translate a kubernetes resource into a terraform kubernetes resource you can use the terraform resource "kubernetes_manifest"
If you need more information about a type of terraform resource you can search it up by doing terraform "insert_resource_name"

`example-non-standard-api.tf`, shows how to define a kubernetes manifest in terraform. This can be used to create any kind of kubernetes resources that are available.
`example-deployment.tf`, shows how to define a kubernetes deployment resource in terraform. This is used to create a kubernetes resources of kind = `Deployment`
`example-service.tf`, shows how to define a kubernetes service resource in terraform. This is used to create a kubernetes resource of kind = `Service`
`example-ingress.tf`, shows how to define a kubernetes ingress resource in terraform. This is used to create a kubernetes resource of kind = `Ingress1`
