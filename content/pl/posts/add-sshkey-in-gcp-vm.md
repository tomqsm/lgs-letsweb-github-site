---
title: "Add ssh key in GCP VM"
date: 2023-08-16
draft: true
tags: [gcp]
---

Check you keys. Lookup in 
1) create a key-pair

```shell
gcloud compute os-login ssh-keys add \
   --key-file=/Users/tomqsm/.ssh/lwb-system.pub \
   --project=lwb-system \
   --ttl=30d
```

check if you have a Workload Identity Pool which is like a key-ring holding access for providers of OIDC e.g. github 
`gcloud iam workload-identity-pools list --location="global" --show-deleted`

`gcloud components update --version 429.0.0` set version on gcloud

`gcloud compute project-info describe \
--format="value(commonInstanceMetadata[items][ssh-keys])"`

`gcloud iam service-accounts list`

`gcloud iam service-accounts add-iam-policy-binding 674668922693-compute@developer.gserviceaccount.com \
--role=roles/iam.workloadIdentityUser \
--member="principal://iam.googleapis.com/projects/674668922693/locations/global/workloadIdentityPools/POOL_ID/subject/SUBJECT"`

https://token.actions.githubusercontent.com  in https://docs.github.com/en/actions/deployment/security-hardening-your-deployments/configuring-openid-connect-in-google-cloud-platform

https://www.youtube.com/watch?v=ZgVhU5qvK1M very helpful