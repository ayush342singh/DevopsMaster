global class BatchClassPractice implements Database.Batchable<sObject> {
	
    global database.QueryLocator start(database.BatchableContext bc){
        string query = 'SELECT Description from Account' ;
        return database.getQueryLocator(query);
        
    }
    
    global void execute(database.BatchableContext bc , List<Account> scope){
        
        for(Account ac : scope){
            if(ac.Description == Null){
                ac.Description = 'ABC';
            }
        }
        update scope;
    }
    global void finish(database.BatchableContext bc){
        
    }
}