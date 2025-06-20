# Install gcloud CLI

- `https://cloud.google.com/sdk/docs/install`

# Configure kubectl with cluster access

Make sure you are logged in to gcloud CLI and have the correct project set.

- `https://cloud.google.com/kubernetes-engine/docs/how-to/cluster-access-for-kubectl`

Once this is all done, you should now be able to run kubectl commands and access the clusters on your google kubernetes engine at will
Use the following command `kubectl config get-contexts` to check if kubectl can access the google kubernetes engine context.
