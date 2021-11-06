using appT3.Db.Map;
using appT3.Models;
using Microsoft.EntityFrameworkCore;

namespace appT3.Db
{
    public class T3AppContext: DbContext
    {
        public virtual DbSet<Note> Notes { get; set; }

        public T3AppContext(DbContextOptions<T3AppContext> options)
            : base(options) { }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            base.OnModelCreating(modelBuilder);
            modelBuilder.ApplyConfiguration(new NoteMap());
        }
    }
}
