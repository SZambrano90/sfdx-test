public class Uccello extends Animale implements Volante
{
    public override void muovi()
    {
        system.debug('L\'uccellino zampetta in giro.');
    }
	public void vola()
    {
        system.debug('Chirp chirp, volo.');
    }
}