public class Convertitore
{
    public static Decimal converterValuta(Decimal input, String valutaStart, String valutaEnd)
    {
        Decimal output;
        switch on valutaStart
        {
            when 'euro'
            {
                switch on valutaEnd
                {
                    when 'dollaro'
                    {
                        output= input*1.12;
                    }
                    when 'sterlina'
                    {
                        output= input*0.9;
                    }
                    when 'yen'
                    {
                        output= input*119.92;
                    }
                }
            }
            when 'dollaro'
            {
                switch on valutaEnd
                {
                    when 'euro'
                    {
                        output= input*0.89;
                    }
                    when 'sterlina'
                    {
                        output= input*0.81;
                    }
                    when 'yen'
                    {
                        output= input*106.92;
                    }
                }
            }
        }
        return output;
    }
    public static Decimal MillimetresToMetres (Decimal mm)
    {
        Decimal metri= mm/1000;
        return metri.setScale(1);
    }
}