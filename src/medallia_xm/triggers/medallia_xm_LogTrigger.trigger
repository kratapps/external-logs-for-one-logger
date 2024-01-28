/**
 * Import external logs from Medallia package to One Logger.
 *
 * https://one-logger.com/extensions/external-logs/medallia_xm/
 */
trigger medallia_xm_LogTrigger on medallia_xm__Log__c(after insert) {
    ok.Logger.publishExternalLogs(Trigger.new);
}