public class ContactUpdateHandler {
    public static void contactInsert(list<Contact> conlist){
        Set<id> accid = new set<id>();
        for(Contact con : conlist){
            accid.add(con.AccountId);
        }
        
        List<Account> accRelatedContact = [SELECT id, Name, No_Of_Contacts__c,(SELECT ID FROM Contacts) FROM Account WHERE id in:accid];
    
        for(Account acc : accRelatedContact){
            acc.No_Of_Contacts__c = acc.Contacts.size();
        }
        update accRelatedContact;
 
    }

}