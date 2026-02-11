Azure Secure Landing Zone (Lite) — Bicep IaC Project
📌 Overview

This project implements a secure Azure Landing Zone (Lite) using modular Bicep Infrastructure as Code. It demonstrates platform-level design with secure networking, controlled access, monitoring, governance guardrails, and cost control — deployed through repeatable IaC modules.

Designed as a reusable foundation for real-world cloud environments and client onboarding scenarios.

🧱 Architecture Components

Hub–Spoke Virtual Network architecture

Azure Bastion for secure VM access

Spoke VM with no public IP

Log Analytics Workspace for monitoring

Azure Policy guardrail (allowed region restriction)

Subscription Budget with cost alert

Modular Bicep deployment structure

(Architecture diagram: see docs/architecture.png)

🔐 Security Features

No direct public access to virtual machines

Bastion-only administrative access

Network segmentation (hub/spoke)

Azure Policy restricting resource locations

Centralized monitoring workspace

Budget threshold alert for cost control

📂 Repository Structure
infra/
  main.bicep
  modules/
    networking.bicep
    bastion.bicep
    vm.bicep
    monitoring.bicep
    policy.bicep
    budget.bicep

docs/
  screenshots and architecture diagram

scripts/
  deployment helpers

⚙️ Deployment Method

Deploy using Azure CLI:

az group create -n rg-landingzone-lite -l australiaeast
az deployment group create -g rg-landingzone-lite -f infra/main.bicep


VM module requires secure admin password parameter during deployment.

📊 Monitoring

Log Analytics workspace deployed

Ready for diagnostic settings and alerts

Central log collection foundation included

🛡️ Governance

Azure Policy assignment for allowed locations

Subscription-level budget configured with alert threshold

💰 Cost Notes

This is a lab-scale deployment using small SKUs (B1s VM).
Resources should be deleted after testing to avoid charges.

Cleanup:

az group delete -n rg-landingzone-lite --yes --no-wait

🎯 Skills Demonstrated

Azure Landing Zone concepts

Hub–Spoke networking

Secure access patterns

Bicep modular IaC design

Governance & policy controls

Monitoring foundation

Cost management awareness

Git-based infrastructure workflow

📸 Evidence

See /docs folder for:

Network deployment

Bastion access

Private VM

Log Analytics

Policy

Budget screenshots