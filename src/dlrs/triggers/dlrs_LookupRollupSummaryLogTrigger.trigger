/**
 * Import external logs from Declarative Lookup Rollup Summaries Tool package to One Logger.
 * Usually, we would run the trigger only after insert.
 * For DLRS, we need to run after update as well, because the package is updating existing logs if they occur more than once.
 * 
 * https://kratapps.com/one-logger/plugins/external-logs-for-one-logger/
 */
trigger dlrs_LookupRollupSummaryLogTrigger on dlrs__LookupRollupSummaryLog__c (after insert, after update) {
    ok.Logger.publishExternalLogs(Trigger.new);
}