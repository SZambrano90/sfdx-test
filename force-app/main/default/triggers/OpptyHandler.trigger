trigger OpptyHandler on SOBJECT (before insert) {
    for(Opportunity o : TRIGGER.NEW){
        List<Opportunity> lst = new List<Opportunity>();
        if(o.StageName = 'Closed Won'){
            Opportunity newOppty = new Opportunity();
            newOppty.AccountId = o.AccountId;
            newOppty.Amount = o.Amount;
            newOppty.Name = o.Name + ' renewal';
            newOppty.StageName = 'Prospecting';
            lst.add(newOppty);
        }
    }
    if(lst.size() > 0){
        insert lst;
    }

}