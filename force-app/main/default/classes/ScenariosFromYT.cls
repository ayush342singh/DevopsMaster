public class ScenariosFromYT {
    //Scenario 1 (Copy billing address to Shipping address)
    public static void copyshippingaddress(list<Account> acc){
        
        for(Account ac : acc){
            if(ac.ShippingCity == null){
                ac.ShippingCity = ac.BillingCity;
                }
            if(ac.ShippingCountry == null){
                ac.ShippingCountry = ac.BillingCountry;
                }
            if(ac.ShippingPostalCode == null){
                ac.ShippingPostalCode = ac.BillingPostalCode;
                }
            if(ac.ShippingState == null){
                ac.ShippingState = ac.BillingState;
                }
            if(ac.ShippingStreet == null){
                ac.ShippingStreet = ac.BillingStreet;
                }
        }
       }
    
    //Scenario 2 (If Annual Revenue is less than 1000 then throw error)
    public static void annualrevenue(list<Account> acc){
        for(Account ac : acc){
            if(ac.AnnualRevenue < 1000){
                ac.AnnualRevenue.adderror('Annual Revenue should be more than 1000');
            }
        }
    }
    
    //Scenario 3 (When user create Account, automatically create contact with same name)
    public static void contactCreate(list<Account> acc){
        List<Contact> conlist = new List<Contact>();
        for(Account ac : acc){
            Contact con = new Contact ();
            con.LastName = ac.Name;
            con.AccountId = ac.Id;
            conlist.add(con);
        }
        if(conlist.size()>0){
            insert conlist;
        }
    }
    
    //Scenario 4 (When Account updated, Throw error if user want to change the account Name)
    public static void updateAccount(list<Account> newvalue , map<id, Account> oldvalue){
        for(Account newMapValue : newvalue){
            Account oldMapValue = oldvalue.get(newMapValue.id);
            
            if(newMapValue.Name!=oldMapValue.Name){
                newMapValue.adderror('Account name cannot be modified once it is created');
            }
        }
    }
    
    //Scenario 5 (Whenever Billing Address is changed in account, update its child contact Billing address also)
    public static void updateContactAddress(list<Account> newvalue , map<id, Account> oldvalue){
        Set<id> accids = new set<id> ();
        
        for(Account ac : newvalue){
            Account accold = oldvalue.get(ac.id);
            if(ac.BillingStreet!=accold.BillingStreet){
                accids.add(ac.id);  
            }
        }
        
        System.debug('Acci' + accids);
        
        List<Account> account = [select id ,name, billingstreet,(select id ,name from contacts) from account where id in: accids];
        List<Contact> contact = new List<Contact> ();
        
        for(Account ac : account){
            List<Contact> con = ac.contacts;
            for(Contact conlist : con){
                conlist.mailingstreet = ac.BillingStreet;
                conlist.mailingcity = ac.BillingCity;
                conlist.mailingcountry = ac.BillingCountry;
                conlist.mailingPostalCode =ac.BillingPostalCode;
                conlist.mailingState =ac.BillingState;
                contact.add(conlist);
            }
        }
        if(contact.size()>0){
            update contact;
            
        }
    }
    
    //Scenario 6 (Whenever Account is Active , User not able to delete Account record)
    public static void beforedelete(List<Account> oldvalue){
        
        for(Account ac : oldvalue){
            if(ac.Active__c == 'Yes'){
                ac.adderror('You cannot delete an active Account');
            }
        }
    } 

    public static void beforedeletechange(List<Account> oldvalue){
        
        // for(Account ac : oldvalue){
        //     if(ac.Active__c == 'Yes'){
        //         ac.adderror('You cannot delete an active Account');
        //     }
        // }
    } 
}