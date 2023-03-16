public class UpdateContactAddress {
    public static void updateContactAddress(list<Account> newvalue , map<id, Account> oldvalue){
        Set<id> accids = new set<id> ();
        
        for(Account ac : newvalue){
            Account accold = oldvalue.get(ac.id);
            if(ac.BillingStreet!=accold.BillingStreet){
                accids.add(ac.id);  
            }
        }
        
        System.debug('Acci' + accids);
        
        List<Account> account = [select id ,name, billingstreet,(select id ,name from contacts) from account 
                                 where id in: accids];
        
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

}