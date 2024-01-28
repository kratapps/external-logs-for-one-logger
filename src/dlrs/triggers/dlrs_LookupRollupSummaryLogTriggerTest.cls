/**
 * Test class for dlrs_LookupRollupSummaryLogTrigger.
 *
 * https://one-logger.com/extensions/external-logs-for-one-logger
 */
@IsTest
private class dlrs_LookupRollupSummaryLogTriggerTest {
    @IsTest
    static void testImport() {
        List<dlrs__LookupRollupSummaryLog__c> externalLogs = new List<dlrs__LookupRollupSummaryLog__c>();
        externalLogs.add(
            new dlrs__LookupRollupSummaryLog__c(
                dlrs__ErrorMessage__c = 'errorMessage',
                dlrs__ParentId__c = 'parentId',
                dlrs__ParentObject__c = 'parentObject'
            )
        );
        externalLogs.add(
            new dlrs__LookupRollupSummaryLog__c(
                dlrs__ErrorMessage__c = 'errorMessage2',
                dlrs__ParentId__c = 'parentId2',
                dlrs__ParentObject__c = 'parentObject2'
            )
        );
        Test.startTest();
        insert externalLogs;
        Test.stopTest();
        externalLogs = queryExternalLogs();
        List<ok__Log__c> logs = queryLogs();
        System.assertEquals(2, logs.size(), 'Expected 2 logs to be created.');
        externalLogs = queryExternalLogs();
        assertExternalLog(externalLogs[0], logs[0]);
        assertExternalLog(externalLogs[1], logs[1]);
    }

    @IsTest
    static void testImportOnUpdate() {
        List<dlrs__LookupRollupSummaryLog__c> externalLogs = new List<dlrs__LookupRollupSummaryLog__c>();
        externalLogs.add(
            new dlrs__LookupRollupSummaryLog__c(
                dlrs__ErrorMessage__c = 'errorMessage',
                dlrs__ParentId__c = 'parentId',
                dlrs__ParentObject__c = 'parentObject'
            )
        );
        externalLogs.add(
            new dlrs__LookupRollupSummaryLog__c(
                dlrs__ErrorMessage__c = 'errorMessage2',
                dlrs__ParentId__c = 'parentId2',
                dlrs__ParentObject__c = 'parentObject2'
            )
        );
        insert externalLogs;
        externalLogs[0].dlrs__ErrorMessage__c = 'errorMessage3';
        externalLogs[1].dlrs__ErrorMessage__c = 'errorMessage4';
        Test.startTest();
        update externalLogs;
        Test.stopTest();
        externalLogs = queryExternalLogs();
        List<ok__Log__c> logs = queryLogs();
        Assert.areEqual(4, logs.size(), 'Expected 2 logs to be created.');
        // dlrs package is updating existing logs based on external ID field dlrs__ParentId__c
        // we expect two new ok__Log__c to be created
        assertExternalLog(externalLogs[0], logs[2]);
        assertExternalLog(externalLogs[1], logs[3]);
    }

    static void assertExternalLog(dlrs__LookupRollupSummaryLog__c externalLog, ok__Log__c log) {
        Assert.isTrue(log.ok__Is_External_Log__c, 'Expected external log.');
        Assert.areEqual(
            String.valueOf(dlrs__LookupRollupSummaryLog__c.SObjectType),
            log.ok__External_Log_Type__c,
            'Invalid external log type.'
        );
        Assert.areEqual(externalLog.Id, log.ok__External_Log_Id__c, 'Invalid external log ID.');
        Assert.isNull(log.ok__Namespace_Prefix__c, 'Invalid ok__Namespace_Prefix__c.');
        Assert.areEqual(externalLog.LastModifiedDate, log.ok__Datetime__c, 'Invalid ok__Datetime__c.');
        Assert.areEqual('ERROR', log.ok__Log_Level__c, 'Invalid ok__Log_Level__c.'); // ERROR is default for external logs
        Assert.areEqual(externalLog.dlrs__ErrorMessage__c, log.ok__Message__c, 'Invalid ok__Message__c.');
        Assert.areEqual(externalLog.dlrs__ParentId__c, log.ok__SObject_Id__c, 'Invalid ok__SObject_Id__c.');
        Assert.areEqual(externalLog.dlrs__ParentObject__c, log.ok__SObject_Type__c, 'Invalid ok__SObject_Type__c.');
        Assert.areEqual(externalLog.LastModifiedById, log.ok__User__c, 'Invalid ok__User__c.');
        Assert.areEqual(externalLog.LastModifiedById, log.ok__User_Id__c, 'Invalid ok__User_Id__c.');
        Assert.areEqual(externalLog.LastModifiedById, log.OwnerId, 'Invalid OwnerId.');
    }

    static List<dlrs__LookupRollupSummaryLog__c> queryExternalLogs() {
        return [
            SELECT Id, LastModifiedDate, LastModifiedById, dlrs__ErrorMessage__c, dlrs__ParentId__c, dlrs__ParentObject__c
            FROM dlrs__LookupRollupSummaryLog__c
        ];
    }

    static List<ok__Log__c> queryLogs() {
        return [
            SELECT
                Id,
                ok__Datetime__c,
                ok__Class_Name__c,
                ok__Log_Level__c,
                ok__Message__c,
                ok__SObject_Id__c,
                ok__SObject_Type__c,
                ok__User__c,
                ok__User_Id__c,
                OwnerId,
                ok__Payload__c,
                ok__Namespace_Prefix__c,
                ok__Is_External_Log__c,
                ok__External_Log_Type__c,
                ok__External_Log_Id__c,
                ok__Stack_Trace__c
            FROM ok__Log__c
        ];
    }
}