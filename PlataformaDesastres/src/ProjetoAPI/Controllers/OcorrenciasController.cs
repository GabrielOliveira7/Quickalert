
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

[ApiController]
[Route("api/[controller]")]
public class OcorrenciasController : ControllerBase
{
    private readonly AppDbContext _context;
    public OcorrenciasController(AppDbContext context) => _context = context;

    [HttpGet]
    public async Task<IActionResult> GetAll() => Ok(await _context.Ocorrencias.ToListAsync());

    [HttpGet("{id}")]
    public async Task<IActionResult> Get(int id)
    {
        var ocorrencia = await _context.Ocorrencias.FindAsync(id);
        return ocorrencia == null ? NotFound() : Ok(ocorrencia);
    }

    [HttpPost]
    public async Task<IActionResult> Create(Ocorrencia ocorrencia)
    {
        _context.Ocorrencias.Add(ocorrencia);
        await _context.SaveChangesAsync();
        return CreatedAtAction(nameof(Get), new { id = ocorrencia.Id }, ocorrencia);
    }

    [HttpPut("{id}")]
    public async Task<IActionResult> Update(int id, Ocorrencia ocorrencia)
    {
        if (id != ocorrencia.Id) return BadRequest();
        _context.Entry(ocorrencia).State = EntityState.Modified;
        await _context.SaveChangesAsync();
        return NoContent();
    }

    [HttpDelete("{id}")]
    public async Task<IActionResult> Delete(int id)
    {
        var ocorrencia = await _context.Ocorrencias.FindAsync(id);
        if (ocorrencia == null) return NotFound();

        _context.Ocorrencias.Remove(ocorrencia);
        await _context.SaveChangesAsync();
        return NoContent();
    }
}
