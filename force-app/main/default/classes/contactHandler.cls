public class contactHandler
{
	public List<Contact> getContact(ID idAccount)
    {
        List<Contact> listContact = new List<Contact>([SELECT FirstName, LastName, MobilePhone FROM Contact WHERE Account.ID =: idAccount]);
        return listContact;
    }
    
    public void printContact(List<Contact> lista)
    {
        for(Contact c : lista)
            system.debug('Nome: ' + c.FirstName + '\nCognome: ' + c.LastName + '\nTelefono: ' + c.MobilePhone);
    }
    
    public void deleteContact(String nome, String cognome)
    {  	 	
		List<Contact> lista = new List<Contact>([SELECT FirstName, LastName FROM Contact WHERE Contact.FirstName =: nome AND Contact.LastName =: cognome]);
        for(Contact c : lista)
        	delete c;
    }
}