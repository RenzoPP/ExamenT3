using appT3.Db;
using appT3.Models;
using Microsoft.EntityFrameworkCore;
using Moq;
using System;
using System.Collections.Generic;
using System.Linq;

namespace appT3UnitTest.Repositories.Mocks
{
    class T3AppContextMock
    {

        public static Mock<T3AppContext> GetApplicationContextMock()
        {
            IQueryable<Note> noteData = GetNoteData();

            var mockDbSetNote = new Mock<DbSet<Note>>();
            mockDbSetNote.As<IQueryable<Note>>().Setup(m => m.Provider).Returns(noteData.Provider);
            mockDbSetNote.As<IQueryable<Note>>().Setup(m => m.Expression).Returns(noteData.Expression);
            mockDbSetNote.As<IQueryable<Note>>().Setup(m => m.ElementType).Returns(noteData.ElementType);
            mockDbSetNote.As<IQueryable<Note>>().Setup(m => m.GetEnumerator()).Returns(noteData.GetEnumerator());
            mockDbSetNote.Setup(m => m.AsQueryable()).Returns(noteData);


            var mockContext = new Mock<T3AppContext>(new DbContextOptions<T3AppContext>());
            mockContext.Setup(c => c.Notes).Returns(mockDbSetNote.Object);

            return mockContext;
        }

        private static IQueryable<Note> GetNoteData()
        {
            return new List<Note>
            {
                new Note { Id = 1, Title = "TitleTest1", Content = "ContentTest1", UpdatedAt = new DateTime(2021, 11,05, 10, 10, 0)},
                new Note { Id = 2, Title = "TitlteTest2", Content = "ContentTest2", UpdatedAt = new DateTime(2021, 11,05, 10, 10, 0)}
            }.AsQueryable();
        }
    }
}
