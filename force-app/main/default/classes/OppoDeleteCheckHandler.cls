public class OppoDeleteCheckHandler {
    public static void beforedelete(List<Account> acclist){
        Set<Id> accIds = new Set<Id> ();
        for(Account ac : acclist){
            accIds.add(ac.Id);    
        }
        Map<id,Account> acc = new Map<id,Account>([select id ,(select id from Opportunities) from Account where id in: accIds]);
        //
        
        for(Account ac : acclist){
            if(acc.get(ac.id).Opportunities.size() > 0){
                ac.adderror('Error');
            }
        }
    }
        
        /*Set<Id> accIdSet = new Set<Id>(); 
        for(Account acc: acclist){
            accIdSet.add(acc.Id);
        }	
        Map<Id, Account> accts = new Map<Id, Account>([select id, (Select Id from Opportunities) from Account  where id in :accIdSet]);
        for(Account acc : acclist){
            if(accts.get(acc.id).Opportunities.size()>0){
                acc.adderror('This Account has some related Opportunity record(s), you cannot delete this Account');
            }
        }*/                              

    }