using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using appT3.Models;
using appT3.Repositories;
using Microsoft.AspNetCore.Mvc;

namespace appT3.Controllers
{
    public class NoteController : Controller
    {
        private readonly INoteRepository repository;

        public NoteController(INoteRepository repository)
        {
            this.repository = repository;
        }

        [HttpGet]
        public IActionResult Index()
        {
            ViewBag.Message = "Obteniendo todas las notas";
            return View(repository.GetAll());
        }

        [HttpGet]
        public IActionResult Create()
        {
            return View(new Note());
        }

        [HttpPost]
        public IActionResult Create(Note note)
        {
            ValidateNoteCreation(note);

            if (!ModelState.IsValid)
                return View("Create", note);

            repository.Create(note);

            TempData["MessageSuccess"] = "Nota registrada correctamente";

            return RedirectToAction("Index");
        }

        [HttpGet]
        public IActionResult Edit(int Id)
        {
            var currentNote = repository.GetNote(Id);
            currentNote.UpdatedAt = DateTime.Now;
            return View(currentNote);
        }

        [HttpPost]
        public IActionResult Edit(Note note)
        {
            ValidateNoteCreation(note);

            if (!ModelState.IsValid)
                return View("Edit", note);

            repository.Update(note);

            TempData["MessageSuccess"] = "Nota actualizada correctamente";

            return RedirectToAction("Index");
        }

        [HttpGet]
        public IActionResult Delete(int Id)
        {
            repository.Delete(Id);
            TempData["MessageSuccess"] = "Nota eliminada correctamente";

            return RedirectToAction("Index");
        }

        private void ValidateNoteCreation(Note note)
        {
            if (string.IsNullOrEmpty(note.Title))
                ModelState.AddModelError("Title", "El titulo es obligatorio");
            if (string.IsNullOrEmpty(note.Content))
                ModelState.AddModelError("Content", "El contenido de la nota es obligatoria");
        }

    }
}