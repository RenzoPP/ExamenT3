using appT3.Db;
using appT3.Models;
using appT3.ViewModels.QueryModels;
using System;
using System.Collections.Generic;
using System.Linq;

namespace appT3.Repositories
{
    public interface INoteRepository
    {
        List<Note> GetAll();
        void Create(Note note);
        List<Note> GetNotesByQuery(NoteQuery query);
        void Delete(Note note);
    }
    public class NoteRepository : INoteRepository
    {
        private readonly T3AppContext context;

        public NoteRepository(T3AppContext context)
        {
            this.context = context;
        }

        public void Create(Note note)
        {
            context.Notes.Add(note);
            context.SaveChanges();
        }

        public void Delete(Note note)
        {
            context.Notes.Remove(note);
            context.SaveChanges();
        }

        public List<Note> GetAll()
        {
            return context.Notes.ToList();
        }

        public List<Note> GetNotesByQuery(NoteQuery query)
        {
            var queryable = context.Notes.AsQueryable();

            if (!string.IsNullOrEmpty(query.Title)){
                queryable = queryable.Where(n => n.Title.Contains(query.Title));
            }

            if (!string.IsNullOrEmpty(query.Content))
            {
                queryable = queryable.Where(n => n.Content.Contains(query.Content));
            }

            return queryable.ToList();
        }
    }
}
