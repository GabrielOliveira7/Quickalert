
public class Ocorrencia
{
    public int Id { get; set; }
    public string Tipo { get; set; } = string.Empty;
    public int Gravidade { get; set; }
    public string Regiao { get; set; } = string.Empty;
    public DateTime DataCriacao { get; set; } = DateTime.UtcNow;
}
