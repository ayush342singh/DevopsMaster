public class TriggerScenarioByPDFOppHandler {
    //Scenario 2
	//Upon Opportunity Creation if Amount is not null and is greater than 100000 then populate ‘Hot Opportunity’ 
	//in description field.
	
        public static void scenario2(List<Opportunity> opplist){
          
            for(Opportunity opp : opplist){
                if(opp.Amount!=null && opp.Amount > 100000){
                    opp.Description = 'Hot Opportunity';
                }
            }
        }

}