#!/bin/bash

terraform workspace select $1
terraform $2 -var-file="$1.tfvars" 