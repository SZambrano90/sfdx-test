public class CheckObject
{
	public static List<Contact> findContact(String nome, String cognome)
    {
        List<Contact> output = [SELECT id, LastName, FirstName FROM Contact WHERE LastName = :cognome AND FirstName = :nome];
        system.debug(output);
        return output;
    }
}