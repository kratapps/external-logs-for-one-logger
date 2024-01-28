<a href="https://kratapps.com/one-logger/plugins/external-logs-for-one-logger/">
  <img title="One Logger" alt="TDF" width="60px" height="60px" align="right"
       src="https://kratapps.com/images/external_logs_for_one_logger_logo_200_200.png"  />
</a>

# External Logs for One Logger

![Beta](https://img.shields.io/badge/beta-yellow)

[![GitHub](https://img.shields.io/badge/GitHub-Public-black?logo=github)](https://github.com/kratapps/external-logs-for-one-logger)

This repository contains One Logger external log configurations. Each
configuration imports logs from third-party solutions into One Logger.

All configurations are available as unmanaged packages, or you can directly
deploy any configuration you need from corresponding source directory.

## Declarative Lookup Rollup Summaries Tool

[![Install Production](https://img.shields.io/badge/Unmanaged%20Package-Install%20Production-cyan)](https://login.salesforce.com/packaging/installPackage.apexp?p0=04t7Q000000EFdV)
[![Install Sandbox](https://img.shields.io/badge/Unmanaged%20Package-Install%20Sandbox-cyan)](https://test.salesforce.com/packaging/installPackage.apexp?p0=04t7Q000000EFdV)

Package Name: DLRS Logs for One Logger  
Directory: src/dlrs  
External Log: dlrs**LookupRollupSummaryLog**c  
Package ID: 033av00000002pp  
Version ID: 04t7Q000000EFdV

Field mappings:

| External Log Field    | One Logger Log Field |
| --------------------- | -------------------- |
| LastModifiedDate      | ok**Datetime**c      |
| dlrs**ErrorMessage**c | ok**Message**c       |
| dlrs**ParentId**c     | ok**SObject_Id**c    |
| dlrs**ParentObject**c | ok**SObject_Type**c  |

## Medallia

[![Install Production](https://img.shields.io/badge/Unmanaged%20Package-Install%20Production-cyan)](https://login.salesforce.com/packaging/installPackage.apexp?p0=04t7Q000000EFZI)
[![Install Sandbox](https://img.shields.io/badge/Unmanaged%20Package-Install%20Sandbox-cyan)](https://test.salesforce.com/packaging/installPackage.apexp?p0=04t7Q000000EFZI)

Package Name: Medallia Logs for One Logger  
Directory: src/medallia_xm  
External Log: medallia_xm**Log**c  
Package ID: 0337Q000000DpFy  
Version ID: 033av00000002t3

Field mappings:

| External Log Field         | One Logger Log Field |
| -------------------------- | -------------------- |
| medallia_xm**ClassName**c  | ok**Class_Name**c    |
| medallia_xm**Level**c      | ok**Log_Level**c     |
| medallia_xm**Message**c    | ok**Message**c       |
| medallia_xm**JSON**c       | ok**Payload**c       |
| medallia_xm**ObjectName**c | ok**SObject_Type**c  |
| medallia_xm**StackTrace**c | ok**Stack_Trace**c   |
| medallia_xm**User**c       | ok**User_Id**c       |
