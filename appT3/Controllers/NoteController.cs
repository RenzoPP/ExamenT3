using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
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
    }
}