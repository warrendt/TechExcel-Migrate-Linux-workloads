---
title: 'Exercise 04: Secure your workloads'
layout: default
nav_order: 6
has_children: true
---

# Exercise 04 - Secure your workloads

## Lab Scenario

In this exercise, you will use Microsoft Defender to help you protect your workloads like Databases, Storage Accounts, and Virtual Machines. You will also configure a managed firewall (Azure Firewll) to protect the network traffic for the terrafirm-onprem-workload-vm as the intention is to block all outgoing internet traffic from this server - as it has now been migrated to Azure via a lift and shift and network access from it out needs to managed.

    >Note: For cost savings you are using the existing onprem VM and existing onprem network. In reality you would create a new virtual network in Azure.

Naming of resources follows the [Azure Naming Standards](https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/ready/azure-best-practices/resource-abbreviations)

## Objectives

After you complete this exercise, you will be able to:

* Review Microsoft Defender Recomendations, Security Alerts and Secure Score.
* Enable Microsoft Defender for SQL and Storage
* Deploy and configure Azure Firewall

## Lab Duration

* **Estimated Time:** 60 minutes
