<a href="https://kratapps.com/one-logger/plugins/external-logs-for-one-logger/">
  <img title="One Logger" alt="TDF" width="60px" height="60px" align="right"
       src="https://kratapps.com/images/external_logs_for_one_logger_logo_200_200.png"  />
</a>

# External Logs for One Logger

![Beta](https://img.shields.io/badge/beta-yellow)

[![GitHub](https://img.shields.io/badge/GitHub-Public-black?logo=github)](https://github.com/kratapps/external-logs-for-one-logger)

This repository contains One Logger external log configurations.
Each configuration imports logs from third-party solutions into One Logger.

All configurations are available as unmanaged packages, 
or you can directly deploy any configuration you need 
from corresponding source directory.

## Declarative Lookup Rollup Summaries Tool

[![Install Production](https://img.shields.io/badge/Unmanaged%20Package-Install%20Production-cyan)](https://login.salesforce.com/packaging/installPackage.apexp?p0=04t7Q000000EFdV)
[![Install Sandbox](https://img.shields.io/badge/Unmanaged%20Package-Install%20Sandbox-cyan)](https://test.salesforce.com/packaging/installPackage.apexp?p0=04t7Q000000EFdV)

Directory: src/dlrs  
Package Name: DLRS Logs for One Logger   
Package ID: 0337Q000000DpFo  
Version ID: 04t7Q000000EFdV  

Fields mappings:

| External Log Field    | One Logger Log Field |
|-----------------------|----------------------|
| LastModifiedDate      | ok__Datetime__c      |
| dlrs__ErrorMessage__c | ok__Message__c       |
| dlrs__ParentId__c     | ok__SObject_Id__c    |
| dlrs__ParentObject__c | ok__SObject_Type__c  |

## Medallia

[![Install Production](https://img.shields.io/badge/Unmanaged%20Package-Install%20Production-cyan)](https://login.salesforce.com/packaging/installPackage.apexp?p0=04t7Q000000EFZI)
[![Install Sandbox](https://img.shields.io/badge/Unmanaged%20Package-Install%20Sandbox-cyan)](https://test.salesforce.com/packaging/installPackage.apexp?p0=04t7Q000000EFZI)

Directory: src/medallia_xm  
Package Name: Medallia Logs for One Logger  
Package ID: 0337Q000000DpFy  
Version ID: 04t7Q000000EFZI  

Fields mappings:

| External Log Field         | One Logger Log Field |
|----------------------------|----------------------|
| medallia_xm__ClassName__c  | ok__Class_Name__c    |
| medallia_xm__Level__c      | ok__Log_Level__c     |
| medallia_xm__Message__c    | ok__Message__c       |
| medallia_xm__JSON__c       | ok__Payload__c       |
| medallia_xm__ObjectName__c | ok__SObject_Type__c  |
| medallia_xm__StackTrace__c | ok__Stack_Trace__c   |
| medallia_xm__User__c       | ok__User_Id__c       |
