---
title: "Useful GCP commands"
date: 2023-08-16
draft: true
tags: [gcp]
---

Check you keys. Lookup in 
1) check you are looged in to a project in GCP `gcloud auth login` - login to a project, this will open you a browser to authenticate through it redirect back to console after

2) 
1) create a key-pair

```shell
gcloud compute os-login ssh-keys add \
   --key-file=/Users/tomqsm/.ssh/lwb-system.pub \
   --project=lwb-system \
   --ttl=30d
```
the added key should be seen now in Compute Engine > Settings > Metadata > SSH Keys
```shell
ssh -i /Users/tomqsm/.ssh/lwb-system.pub tomaszkusmierczyk_letsweb_biz@34.118.7.200
```

`gcloud iam service-accounts list` show service accounts in the current GCP project 