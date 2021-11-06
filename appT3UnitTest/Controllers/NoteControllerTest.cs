using appT3.Controllers;
using appT3.Models;
using appT3.Repositories;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.ViewFeatures;
using Moq;
using NUnit.Framework;
using System.Collections.Generic;

namespace appT3UnitTest.Controllers
{
    class NoteControllerTest
    {
        private Mock<INoteRepository> repository;

        [SetUp]
        public void SetUp()
        {
            repository = new Mock<INoteRepository>();
        }

        [Test]
        public void TestIndexIsSuccess()
        {
            repository.Setup(n => n.GetAll()).Returns(new List<Note>());

            var controller = new NoteController(repository.Object);
            var view = controller.Index() as ViewResult;

            Assert.IsInstanceOf<List<Note>>(view.Model);
        }

        [Test]
        public void TestNoteCreateWhenValidationFail()
        {
            var note = new Note();
            var controller = new NoteController(repository.Object);

            var view = controller.Create(note);

            Assert.IsInstanceOf<ViewResult>(view);
            repository.Verify(n => n.Create(note), Times.Exactly(0));
        }

        [Test]
        public void TestNoteCreateWhenValidationSuccess()
        {
            var note = new Note { Title = "SomeTitle", Content = "SomeContent" };
            var controller = new NoteController(repository.Object);
            var tempMock = new Mock<ITempDataDictionary>();
            controller.TempData = tempMock.Object;

            var view = controller.Create(note);

            Assert.IsInstanceOf<RedirectToActionResult>(view);
            repository.Verify(n => n.Create(note), Times.Once);
        }

        [Test]
        public void TestNoteEditWhenValidationFail()
        {
            var note = new Note();
            var controller = new NoteController(repository.Object);

            var view = controller.Edit(note);

            Assert.IsInstanceOf<ViewResult>(view);
            repository.Verify(n => n.Update(note), Times.Exactly(0));
        }

        [Test]
        public void TestNoteEditWhenValidationSuccess()
        {
            var note = new Note { Id = 1, Title = "TitleModified", Content = "ContentModified" };
            var controller = new NoteController(repository.Object);
            var tempMock = new Mock<ITempDataDictionary>();
            controller.TempData = tempMock.Object;

            var view = controller.Edit(note);

            Assert.IsInstanceOf<RedirectToActionResult>(view);
            repository.Verify(n => n.Update(note), Times.Once);
        }

        [Test]
        public void TestNoteDelete()
        {
            var noteId = 1;
            var controller = new NoteController(repository.Object);

             var tempMock = new Mock<ITempDataDictionary>();
            controller.TempData = tempMock.Object;
            var view = controller.Delete(noteId);

            Assert.IsInstanceOf<RedirectToActionResult>(view);
            repository.Verify(n => n.Delete(noteId), Times.Once);
        }
    }
}
