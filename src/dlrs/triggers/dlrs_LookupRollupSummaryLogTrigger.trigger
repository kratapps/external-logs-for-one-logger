/**
 * Import external logs from the Declarative Lookup Rollup Summaries (DLRS) Tool package into One Logger.
 * Typically, the trigger is executed only after insertion. However, for DLRS, it is necessary to run the trigger after an update as well. This is due to the package's functionality of updating existing logs when they occur more than once.
 *
 * https://one-logger.com/extensions/external-logs-for-one-logger
 */
trigger dlrs_LookupRollupSummaryLogTrigger on dlrs__LookupRollupSummaryLog__c(after insert, after update) {
    ok.Logger.publishExternalLogs(Trigger.new);
}