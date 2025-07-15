# 🌐 Project 1: EC2 Nginx Web Server with Terraform

## ✅ Overview
This project provisions an EC2 instance using Terraform and automatically installs Nginx using EC2 user data. It demonstrates Infrastructure as Code (IaC), automated provisioning, and basic web hosting on AWS.

## 🔧 Technologies Used
- AWS EC2
- Terraform
- Amazon Linux 2
- Nginx
- SSH (key pair)
- Security Groups

## 🏗️ What It Does
- Creates a key pair for SSH access
- Sets up a security group allowing SSH (port 22) and HTTP (port 80)
- Provisions a t2.micro EC2 instance
- Uses user data to auto-install Nginx on boot
- You can access the web server via the instance's public IP

## 🚀 How to Deploy

```bash
terraform init
terraform apply
