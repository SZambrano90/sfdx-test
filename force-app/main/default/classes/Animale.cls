public virtual class Animale
{
    private String nome;
    private Integer nZampe;
    
    public String getNome()
    {
        return this.nome;
    }
    public Integer getNZampe()
    {
        return this.nZampe;
    }
    
    public void setNome(String nome)
    {
        this.nome = nome;
    }
    public void setNZampe(Integer nZampe)
    {
        this.nZampe = nZampe;
    }
    
	public virtual void muovi()
    {
        system.debug('Mi sto muovendo.');
    }
}