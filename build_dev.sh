#!/bin/bash

export AWS_PROFILE=terraform_sandbox
cd ./dev && time (terraform init && terraform plan && terraform apply)