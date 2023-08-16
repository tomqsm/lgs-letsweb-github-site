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