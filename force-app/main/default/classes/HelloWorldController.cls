public class HelloWorldController
{
    @AuraEnabled
	public static List<Contact> getContacts(Integer page)
    {
        Integer offset;
        if(page == null || page <= 0)
            offset = 0;
        else
            offset = (page-1)*10;
        Integer maxContact = [SELECT Count() FROM Contact];
        return [SELECT Id, Name, Phone FROM Contact LIMIT 10 OFFSET :offset];
    }
    
    @AuraEnabled
    public static Integer getNumberOfContacts()
    {
        return [SELECT Count() FROM Contact];
    }
    
    @AuraEnabled
    public static Contact insertContacts(String nome, String cognome)
    {
        Contact c = new Contact();
        c.LastName = cognome;
        c.FirstName = nome;
        insert c;
        return c;
    }
}