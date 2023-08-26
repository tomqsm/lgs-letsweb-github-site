---
title: "Useful GCP commands"
date: 2023-08-16
draft: false
tags: [gcp]
---
A couple of useful GCP gcloud commands.
<!--more-->
1) check you are signed in a project in GCP `gcloud auth login` - login to a project, this will open you a browser to authenticate through it redirect back to console after
1) `gcloud compute ssh username@vmname --ssh-key-file=~/.ssh/google_vm`
2) `gcloud iam service-accounts list` show service accounts in the current GCP project
3) `export SERVICE_ACCOUNT=github-actions@your-system.iam.gserviceaccount.com`
3) `gcloud compute scp --zone europe-central2-a --recurse ./layouts jump:~/public` send a `layout` folder to a public folder in the VM named jump
4) `gcloud iam service-accounts describe $SERVICE_ACCOUNT`
2) add new priviliges to a service account
```shell
   gcloud projects add-iam-policy-binding your-system \\
   --member "serviceAccount:$SERVICE_ACCOUNT" \\
   --role "roles/serviceusage.serviceUsageViewer"
```