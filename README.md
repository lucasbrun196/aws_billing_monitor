# AWS Billing Monitor - Terraform IaC

This project is an Infrastructure as Code (IaC) solution built with Terraform to monitor AWS billing. It automatically triggers an email notification to subscribers of an SNS (Simple Notification Service) topic whenever AWS starts charging the account.

## Features

- Monitors AWS billing activity in your account.
- Uses AWS CloudWatch to detect billing events.
- Sends email notifications to SNS topic subscribers when charges are detected.
- Fully defined and managed via Terraform for easy setup and maintenance.

## Prerequisites

- Terraform 1.x or higher
- AWS Account with billing enabled
- AWS CLI configured with appropriate permissions

## Components

- **CloudWatch Billing Alerts**: Monitors AWS billing activity.
- **SNS Topic**: Publishes alerts to subscribers (email notifications).
- **IAM Role**: Provides necessary permissions for CloudWatch to trigger SNS notifications.

## Setup

### 1. Clone the Repository

```bash
git clone https://github.com/yourusername/aws-billing-monitor.git
cd aws-billing-monitor
```

### 2. Configure your aws account

- Download the aws cli
```bash
  aws configure
```
- Set your aws credentials, aws region(us-east-1), aws access key, aws secret access key, format(json)


### 3. Terraform Code

- Go to the variables file and set your email that you gonna recive the email alerts
```hcl
variable "accountEmail" {
  nullable = false
  type = string
  default = "" // your email here
}
```

### 4. Command Line on project root

```bash
terraform init (just if wasn't initialized)
terraform plan
terraform apply
```

### 5. Done

Then go to your email and accept the subscription of SNS Topic

