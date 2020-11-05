public class MapExercise
{
    Map<Integer, String> mappa = new Map<Integer, String>();
    
    //public void printMap(Map<Integer, String> mappa)
    //{
    //    for(Integer i : mappa.keySet())
    //        system.debug(i + ', ' + mappa.get(i));
    //}
    
    public void printMapKeys(Map<Integer, String> mappa)
    {
        for(Integer i : mappa.keySet())
            system.debug(i);
    }
    
    public void lookFor(String element)
    {
        system.debug(this.mappa.values().contains(element) ? 'Trovato.' : (element + ' non presente.'));
    }
    
    public void checkIfEmpty(Map<Integer, String> mappa)
    {
        system.debug(mappa.isEmpty() ? 'La mappa è vuota.' : 'La mappa è piena.');
    }
    
	public void run()
    {
		this.mappa.put(1, 'Red');
		this.mappa.put(2, 'Green');
		this.mappa.put(3, 'Black');
		this.mappa.put(4, 'White');
		this.mappa.put(5, 'Blue');
        system.debug(this.mappa);
        //printMap(this.mappa);
        
        this.lookFor('Purple');
        this.lookFor('Green');
        
        //printMapKeys(this.mappa);
        system.debug(this.mappa.keySet());
        
        Map<Integer, String> newMap = new Map<Integer, String>();
        checkIfEmpty(newMap);
        newMap.putAll(this.mappa);
        checkIfEmpty(newMap);
        
        //printMap(newMap);
        system.debug(newMap);
        system.debug(newMap.keySet());
        //printMapKeys(newMap);
    }
}