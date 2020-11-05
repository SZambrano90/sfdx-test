public class CalculatorSOAPHandler
{
    CalculatorServices.CalculatorImplPort calculator = new CalculatorServices.CalculatorImplPort();
    
	public double getSum(Double x, Double y)
    {
        Double result;
        result = calculator.doAdd(x, y);
        system.debug('La somma di ' + x + ' e ' + y + ' è '+ result + '.');
        return result;
    }
    
	public double getDiff(Double x, Double y)
    {
        Double result;
        result = calculator.doSubtract(x,y);
        system.debug('La differenza di ' + x + ' e ' + y + ' è '+ result + '.');
        return result;
    }
    
	public double getMult(Double x, Double y)
    {
        Double result;
        result = calculator.doMultiply(x,y);
        system.debug('Il prodotto di ' + x + ' e ' + y + ' è '+ result + '.');
        return result;
    }
    
	public double getDiv(Double x, Double y)
    {
        Double result;
        result = calculator.doDivide(x,y);
        system.debug('Il quoziente di ' + x + ' e ' + y + ' è '+ result + '.');
        return result;
    }
}