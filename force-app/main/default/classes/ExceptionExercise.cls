public class ExceptionExercise
{
    public void executeDmlException()
    {
        Contact c = new Contact();
        insert c;
    }
    
    public void executeListException()
    {
        List<Contact> l = new List<Contact>();
        system.debug(l[3]);
    }
    
    public void executeNullPointerException()
    {
        Account a = new Account();
        system.debug(10/a.NumberOfEmployees);
    }
    
    public void executeQueryException()
    {
        Account a = [SELECT Name FROM Account WHERE Name = 'sfghsghfg' LIMIT 1];
    }
}