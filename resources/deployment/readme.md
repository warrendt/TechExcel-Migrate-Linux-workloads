# Before Hands-on Lab Deployment Scripts

This directory contains the Lab setup deployment scripts for creating the required Azure Resources for this lab.

Click the button below to deploy the existing Terra Firm resources for the Lab to your Azure Subscription:

[![Deploy To Azure](../images/deploytoazure.svg)](https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2Fmicrosoft%2FMicrosoft-TechExcel-Migrate-Linux-Workloads%2Fmain%2Fresources%2Fdeployment%2Fdeploy.json)

## Notes

- This directory contains both a ARM Template (`deploy.json`) file and Azure Bicep (`deploy.bicep`) file for automating the deployment of the resources necessary for the lab.

- When authoring these scripts the infrastructure deployment was authored in Azure Bicep first within the `deploy.bicep` file, and then the Azure Bicep CLI `./bicep build` command was used to build the matching ARM Template.
