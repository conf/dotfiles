setkube () {
  echo "Account: $1"
  echo "Project: $2"
  echo "Cluster: $3"
  gcloud config set account $1
  gcloud config set project $2
  gcloud config set container/cluster $3 --project $2
  gcloud container clusters get-credentials $3 --project $2 --zone us-central1-b
  echo "Done."
}
