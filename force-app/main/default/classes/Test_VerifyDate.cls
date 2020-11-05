@isTest
public class Test_VerifyDate
{
	@isTest
    static void checkVerifyDate30Days()
    {
        Date d1 = date.valueOf('2020-03-03');
        Date d2 = date.valueOf('2020-03-15');
        
        VerifyDate.CheckDates(d1, d2);
    }
    
    @isTest
    static void checkVerifyDateBeyond30Days()
    {
        Date d1 = date.valueOf('2020-03-03');
        Date d2 = date.valueOf('2020-05-15');
        
        VerifyDate.CheckDates(d1, d2);
    }
}