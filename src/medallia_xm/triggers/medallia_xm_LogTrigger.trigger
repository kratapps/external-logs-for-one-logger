/**
 * Import external logs from Medallia package to One Logger.
 * 
 * https://kratapps.com/one-logger/plugins/external-logs-for-one-logger/
 */
trigger medallia_xm_LogTrigger on medallia_xm__Log__c (after insert) {
    ok.Logger.publishExternalLogs(Trigger.new);
}