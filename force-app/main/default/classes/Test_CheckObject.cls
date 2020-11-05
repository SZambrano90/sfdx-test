@isTest
public class Test_CheckObject
{
	@isTest
    static void contactTest()
    {
        Contact c1 = new Contact();
        c1.FirstName = 'Mariotest';
        c1.LastName = 'Rossitest';
        
        Contact c2 = new Contact();
        c2.FirstName = 'Mariotest';
        c2.LastName = 'Neritest';
        
        List<Contact> lista = new List<Contact>();
        lista.add(c1);
        lista.add(c2);
        
        insert lista;
        
        Test.startTest();
        List<Contact> checkLista = CheckObject.findContact('Mariotest', 'Rossitest');
        Test.stopTest();
    }
}