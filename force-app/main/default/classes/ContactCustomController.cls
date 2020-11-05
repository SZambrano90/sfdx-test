public class ContactCustomController
{
	private String sortOrder = 'LastName';
    private String limitQuery = '10';
    public Contact cont {get; set;}
    
    public List<Contact> getContacts()
    {
        List<Contact> res = Database.query('SELECT Id, FirstName, LastName, Email ' + 
                                           'FROM Contact ' + 
                                           'ORDER BY ' + sortOrder + ' ' +
                                           'LIMIT ' + limitQuery);
        
        return res;
    }
    
    public void saveAction()
    {
        try
        {
            insert cont;
        }
        catch(Exception e)
        {
            System.debug('Fell into an exception: ' + e);
        }
    }
}