/**
 * Test class for medallia_xm_LogTrigger.
 *
 * https://one-logger.com/extensions/external-logs-for-one-logger
 */
@IsTest
private class medallia_xm_LogTriggerTest {
    @IsTest
    static void testImport() {
        List<medallia_xm__Log__c> externalLogs = new List<medallia_xm__Log__c>();
        externalLogs.add(
            new medallia_xm__Log__c(
                medallia_xm__ClassName__c = 'className',
                medallia_xm__JSON__c = '{}',
                medallia_xm__Level__c = 'INFO',
                medallia_xm__Message__c = 'message',
                medallia_xm__StackTrace__c = 'stackTrace',
                medallia_xm__User__c = UserInfo.getUserId(),
                medallia_xm__ObjectName__c = 'Account'
            )
        );
        externalLogs.add(
            new medallia_xm__Log__c(
                medallia_xm__ClassName__c = 'className2',
                medallia_xm__JSON__c = '{"foo":"bar"}',
                medallia_xm__Level__c = 'WARN',
                medallia_xm__Message__c = 'message2',
                medallia_xm__StackTrace__c = 'stackTrace2',
                medallia_xm__User__c = UserInfo.getUserId(),
                medallia_xm__ObjectName__c = 'Contact'
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

    static void assertExternalLog(medallia_xm__Log__c externalLog, ok__Log__c log) {
        Assert.isTrue(log.ok__Is_External_Log__c, 'Expected external log.');
        Assert.areEqual(String.valueOf(medallia_xm__Log__c.SObjectType), log.ok__External_Log_Type__c, 'Invalid external log type.');
        Assert.areEqual(externalLog.Id, log.ok__External_Log_Id__c, 'Invalid external log ID.');
        Assert.isNull(log.ok__Namespace_Prefix__c, 'Invalid ok__Namespace_Prefix__c.');
        Assert.areEqual(externalLog.medallia_xm__ClassName__c, log.ok__Class_Name__c, 'Invalid ok__Class_Name__c.');
        Assert.areEqual(externalLog.medallia_xm__JSON__c, log.ok__Payload__c, 'Invalid ok__Payload__c.');
        Assert.areEqual(externalLog.medallia_xm__Level__c, log.ok__Log_Level__c, 'Invalid ok__Log_Level__c.');
        Assert.areEqual(externalLog.medallia_xm__Message__c, log.ok__Message__c, 'Invalid ok__Message__c.');
        Assert.areEqual(externalLog.medallia_xm__StackTrace__c, log.ok__Stack_Trace__c, 'Invalid ok__Stack_Trace__c.');
        Assert.areEqual(externalLog.medallia_xm__User__c, log.ok__User__c, 'Invalid ok__User__c.');
        Assert.areEqual(externalLog.medallia_xm__User__c, log.ok__User_Id__c, 'Invalid ok__User_Id__c.');
        //        System.assertEquals(externalLog.medallia_xm__ObjectIDs__c, log.?, 'Invalid ?.'); todo
        Assert.areEqual(externalLog.medallia_xm__ObjectName__c, log.ok__SObject_Type__c, 'Invalid ok__User_Id__c.');
    }

    static List<medallia_xm__Log__c> queryExternalLogs() {
        return [
            SELECT
                Id,
                medallia_xm__ClassName__c,
                medallia_xm__JSON__c,
                medallia_xm__Level__c,
                medallia_xm__Message__c,
                medallia_xm__ObjectIDs__c,
                medallia_xm__ObjectName__c,
                medallia_xm__StackTrace__c,
                medallia_xm__User__c
            FROM medallia_xm__Log__c
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