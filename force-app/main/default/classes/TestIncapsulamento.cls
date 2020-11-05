public class TestIncapsulamento
{
	private Integer numero;
    private String nome;
    
    public String getNome()
    {
        return this.nome;
    }
    public Integer getNumero()
    {
        return this.numero;
    }
    
    public void setNome(String nome)
    {
        this.nome = nome;
    }
    public void setNumero(Integer numero)
    {
        this.numero = numero;
    }
}