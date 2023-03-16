public with sharing class wireDecoratorPracticeHandler {
    @AuraEnabled(cacheable = true)
    public static List<Contact> getContact(){
        try {
            List<Contact> conlist = [SELECT id, Name From Contact ];
            return conlist;
            
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }

    @AuraEnabled
    public static List<Contact> getContactimperative(){
        try {
            List<Contact> conlist = [SELECT id, Name From Contact ];
            return conlist;
            
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }
    
}