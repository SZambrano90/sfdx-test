@isTest
public class Convertitore_Test
{
    @isTest
    static void testEurUsd()
    {
        Decimal convert = Convertitore.converterValuta(100,'euro','dollaro');
        System.assertEquals(112, convert);
    }
    @isTest
    static void testEurSpd()
    {
        Decimal convert = Convertitore.converterValuta(100,'euro','sterlina');
        System.assertEquals(90, convert);
    }
    @isTest
    static void testEurJpy()
    {
        Decimal convert = Convertitore.converterValuta(100,'euro','yen');
        System.assertEquals(11992, convert);
    }
    @isTest
    static void testUsdEur()
    {
        Decimal convert = Convertitore.converterValuta(100,'dollaro','euro');
        System.assertEquals(89, convert);
    }
    @isTest
    static void testUsdSpd()
    {
        Decimal convert = Convertitore.converterValuta(100,'dollaro','sterlina');
        System.assertEquals(81, convert);
    }
    @isTest
    static void testUsdJpy()
    {
        Decimal convert = Convertitore.converterValuta(100,'dollaro','yen');
        System.assertEquals(10692, convert);
    }
    
    @isTest
    static void testEquivalenza()
    {
        Decimal risultato=Convertitore.MillimetresToMetres(2500);
        System.assertEquals(2.5, risultato);
    }
}