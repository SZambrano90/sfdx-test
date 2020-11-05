public class ListExercise
{
    List<String> colors = new List<String>{'Red','Green','Orange','White','Black'};
        
    //public void printColors(List<String> colors)
    //{
    //    for(String s : colors)
    //        system.debug(s);
    //    system.debug('*********');
	//}
    
    public void switchColors(String colorOld, String colorNew)
    {
        if(colors.contains(colorOld))
        {
            for(Integer i = 0; i < colors.size(); i++)
            	if(colors.get(i) == colorOld)
            	{
                	colors.set(i, colorNew);
                    break;
            	}
        }
    }
    
    public void removeColor(String color)
    {
        if(colors.contains(color))
            for(Integer i = 0; i < colors.size(); i++)
            	if(colors.get(i) == color)
            		colors.remove(i);
    }
    
    public void run()
    {
        system.debug(this.colors);
        
        //printColors(this.colors);
        
    	this.switchColors('Orange','Yellow');
        system.debug(this.colors);
    	//printColors(this.colors);
        
    	this.removeColor('Yellow');
        system.debug(this.colors);
    	//printColors(this.colors);
        
        List<String> newList = this.colors.clone();
        newList.sort();
        system.debug(newList);
        //printColors(newList);
    }
}