public class TriggerScenarioByPDFHandler {
        //Scenario 1
        //Upon Account Creation if Industry is not null and having value as ‘Media’ then populate Rating as Hot.
        
        public static void scenario1(List<Account> acclist){
            
                    for(Account ac : acclist){
                        if(ac.Industry == 'Media'){
                            ac.Rating = 'Hot';   
                        }
                    }   
        }
    
    	//Scenario 3
    	//When an account inserts and CopyBillingToShipping (Custom Field) checkbox is
		//checked then automatically copy account billing address into account shipping address.
		
    public static void scenario3(list<Account> acclist){
        
        for(Account ac : acclist){
            if(ac.CopyBillingToShipping__c == true && ac.BillingCity!=null && ac.BillingCountry!=null
              && ac.BillingPostalCode!=null && ac.BillingState!=null && ac.BillingStreet!=null)
                {  
                    ac.ShippingCity = ac.BillingCity;
                    ac.ShippingCountry = ac.ShippingCountry;
                    ac.ShippingPostalCode = ac.BillingPostalCode;
                    ac.ShippingState = ac.BillingState;
                    ac.ShippingStreet =ac.BillingStreet;
                } 
            }
    }
    
    // Sceanario >> Account records cannot be deleted if active is Yes
    public static void beforedelete(List<Account> acclist){
        
        for(Account acc : acclist){
            if(acc.Active__c == 'Yes'){
                acc.adderror('You can not delete the record when account is Active');
            }
        }
    }
    
    // Scenario >> Prevent account record from being edited if the record is created 7 days back.
    public static void beforeupdate(List<Account> acclist){
        for(Account acc : acclist){
            if(acc.CreatedDate<System.today()-6){
                acc.adderror('YOu can not update those record which is created 7 days back.');
            }
        }
    }
    
    // Write a trigger on Account and check only System Administrator profile users should be able to delete an account.
    public static void beforedeleteSystemAdmin(List<Account> acclist){
        
        profile p = [select id from profile where name = 'System Administrator'];
        
        for(Account ac : acclist){
            if(userinfo.getUserId() !=p.id){
                ac.adderror('Only system admin can delete this record');
            }
        }
    }
    

}