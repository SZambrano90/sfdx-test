public class setExercise
{
    Set<String> colors1 = new Set<String>();
    Set<String> colors2 = new Set<String>();
    
    public void checkElements(Set<String> set1, Set<String> set2)
    {
        for(String s : set1)
            system.debug(set2.contains(s) ? (s + ' è contenuto.') : (s + ' non è contenuto.'));
    }
    
	public void run()
    {
        colors1.add('Red');
        colors1.add('Green');
        colors1.add('Black');
        colors1.add('White');
        
        colors2.add('Red');
        colors2.add('Pink');
        colors2.add('Black');
        colors2.add('Orange');
        
        system.debug(colors1);
        system.debug(colors2);
        
        List<String> listColors = new List<String>();
        listColors.addAll(colors1);
        system.debug(listColors);
        
        this.checkElements(colors1, colors2);
        
        Set<String> intersection = colors1.clone();
        intersection.retainAll(colors2);
        system.debug(intersection);
    }
}