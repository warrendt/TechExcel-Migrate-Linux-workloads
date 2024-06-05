---
title: Introduction
layout: home
nav_order: 1
---

# TechExcel: Migrate Linux workloads to Azure

Terra Firm Laboratories is a global bioengineering company that’s the leading researcher and innovator in genetic and biological science technology. The company was founded in 1975 with its corporate headquarters in Palo Alto, CA. Their mission-critical workloads are currently hosted in an on-premises datacenter and are beginning a journey to modernize and migrate into the cloud using Microsoft Azure.

The CTO, Dennis Nedry, has kicked off an initiative for the organization to begin adopting the Microsoft Azure cloud and modernize its infrastructure. He has already had his team begin assessing their current environment and what it will take to migrate to the cloud. They are looking to optimize their technology investments by reducing technical debt and streamlining operations using Azure Infrastructure-as-a-Service (IaaS) and Platform-as-a-Service (PaaS) cloud services.

Terra Firm Laboratories has already completed the first round of analysis to identify the applications and workloads to begin migrating first. Out of over 250 workloads they have running on-premises, they have identified one workload that exemplifies multiple components common across many of their other workloads. They decided to use a simpler workload that will still assist in proving out the migration plan as it’s developed. This workload includes a web based order system written in PHP that is running on Red Hat Enterprise Linux (RHEL) servers connecting to a PostgreSQL database on-premises.

In this lab, attendees will perform steps toward migrating Terra Firm Laboratories on-premises Linux workloads to Microsoft Azure.  This will involve migration of the on-premises database to an Azure Database for PostgreSQL Flexible Server - a managed database service.  Attendees will then configure the web application to make use of the migrated database.

## Azure services and related products

- Azure VMs
- Azure Arc
- Azure Database for PostgreSQL - Flexible Server
- Azure Networking
- Migration service in Azure Database for PostgreSQL
- Azure Data Studio
- Azure Defender
- Azure Firewall

## Solution architecture

![Diagram showing the proposed solution architecture](./resources/images/Solution_Architecture_Diagram.png "Solution architecture diagram")

## Exercises

This lab has exercises on:

- Provisioning a Linux Server VM
- Set up a Linux Server for application migration to Azure
- Migrate an on-premises PostgreSQL Database to Azure Database for PostgreSQL - Flexible Server
- Secure Linux workloads
- Enable Azure Arc on an on-premises virtual machine so it can be managed from Azure

This lab is available as GitHub pages [here](https://microsoft.github.io/TechExcel-Migrate-Linux-workloads/)

## Prerequisites

For running this lab you will need:

    - An Azure subscription without a spending cap.
    - A desktop, laptop, or virtual machine and access to install software on that machine.
