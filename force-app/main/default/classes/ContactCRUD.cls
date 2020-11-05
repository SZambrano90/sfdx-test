public class ContactCRUD
{
	public List<Contact> searchForContacts(String firstName, String lastName)
    {
        List<Contact> listContact = new List<Contact>([SELECT FirstName, LastName FROM Contact WHERE FirstName =: firstName AND LastName =: lastName]);
        return listContact;
    }
    
    public List<Contact> searchForContacts(String firstName, String lastName, Integer limite)
    {
        List<Contact> listContact = new List<Contact>([SELECT FirstName, LastName FROM Contact WHERE FirstName =: firstName AND LastName =: lastName LIMIT :limite]);
        return listContact;
    }
    
    public void insertContact(String firstName, String lastName)
    {
        Contact c = new Contact();
        Contact[] insertList = new List<Contact>();
        c.FirstName = firstName;
        c.LastName = lastName;
        insertList.add(c);
        
        Database.SaveResult[] insertRes = Database.insert(insertList, false);
        for(Database.SaveResult s : insertRes)
        {
            if(s.isSuccess() == true)
                system.debug('Insert for object ' + c.Id + ' successful.');
            else
                system.debug('Insert failed.');
        }
    }
    
    public void deleteContact(String firstName, String lastName)
    {
        List<Contact> listContact = searchForContacts(firstName, lastName, 1);
        if(listContact.isEmpty())
            system.debug('Contact not found.');
        else
        {
            Database.DeleteResult[] deleteRes = Database.delete(listContact);
            for(Database.DeleteResult d : deleteRes)
            {
                if(d.isSuccess() == true)
                    system.debug('Deletion of contact successful.');
                else
                    system.debug('Delete failed.');
            }
        }
    }
    
    public void updateContact(String firstName, String lastName, String phone)
    {
        List<Contact> listContact = searchForContacts(firstName, lastName, 1);
        if(listContact.isEmpty())
            system.debug('Contact not found.');
        else
        {
            listContact[0].Phone = phone;
            Database.SaveResult[] updateRes = Database.update(listContact, false);
            for(Database.SaveResult s : updateRes)
            {
                if(s.isSuccess() == true)
                    system.debug('Update for object ' + listContact[0].Id + ' successful.');
                else
                    system.debug('Update failed.');
            }
        }
    }
}