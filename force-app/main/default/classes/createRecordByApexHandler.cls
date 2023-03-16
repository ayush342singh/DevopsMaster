public with sharing class createRecordByApexHandler {
    @AuraEnabled
    public static List<Account> updateRecord(String accId , String accName , String accInd){
        try {
            List<Account> acclist = new List<Account>();

            if(accId != null){
                Account obj = new Account ();
                obj.Id = accId;
                obj.Name = accName;
                obj.Industry = accInd;
                acclist.add(obj);
            }

            if(!acclist.isEmpty()){
                System.debug('acclist: ' + acclist);
                update acclist;
                return acclist;
            }

            return null;
            
        } 
        
        catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }













    @AuraEnabled
    public static List<Account> createRecord(string accName , string accInd){
        try {
            List<Account> acclist = new List<Account>();

            if(accName != null){
                Account obj = New Account();
                obj.Name = accName;
                obj.Industry = accInd;
                acclist.add(obj);
            }

            if(!acclist.isEmpty()){
                insert acclist;
                return acclist;
            }

            return Null;
        } 
        
        catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }
    
}