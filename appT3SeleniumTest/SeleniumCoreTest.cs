using NUnit.Framework;
using OpenQA.Selenium;
using OpenQA.Selenium.Chrome;
using System.Collections.Generic;

namespace appT3SeleniumTest
{
    public class SeleniumCoreTest
    {
        private ChromeOptions chromeOptions;        
        private string ChromeDriverLink;
        private string Website;
        private IWebDriver webDriver;
        
        [SetUp]
        public void Setup()
        {
            ChromeDriverLink = @"C:\driver\Web";
            Website = "https://localhost:44311/";
            chromeOptions = new ChromeOptions();
            chromeOptions.AcceptInsecureCertificates = true;
            webDriver = new ChromeDriver(chromeOptions);       
            webDriver.Navigate().GoToUrl(Website);
        }

        [Test]
        public void NavigateToNotesList()
        {
            var urlToCompare = Website; 
            Assert.AreEqual(webDriver.Url, urlToCompare);
        }

        [Test]
        public void FindTitleFieldIntoCreateIndex()
        {
            IWebElement lnkAddNote = webDriver.FindElement(By.Id("AddNote"));
            lnkAddNote.Click();

            IWebElement nameTitle = webDriver.FindElement(By.Name("Title"));
            Assert.That(nameTitle.Displayed, Is.True);
        }

        [Test]
        public void FindContentFieldIntoCreateIndex()
        {
            IWebElement lnkAddNote = webDriver.FindElement(By.Id("AddNote"));
            lnkAddNote.Click();

            IWebElement nameTitle = webDriver.FindElement(By.Name("Content"));
            Assert.That(nameTitle.Displayed, Is.True);
        }

        private void InsertNewNote(IWebDriver webDriver)
        {
            IWebElement lnkAddNote = webDriver.FindElement(By.Id("AddNote"));
            lnkAddNote.Click();

            IWebElement nameTitle = webDriver.FindElement(By.Name("Title"));
            nameTitle.SendKeys("SeleniumRegisterTitle");

            IWebElement contentTitle = webDriver.FindElement(By.Name("Content"));
            contentTitle.SendKeys("SeleniumRegisterContent");

            IWebElement btnSend = webDriver.FindElement(By.Id("BtnSave"));
            btnSend.Click();
        }

        [Test]
        public void VerifyInsertNewNote()
        {
            InsertNewNote(webDriver);
            Assert.AreEqual(webDriver.Url, Website);
        }

        [Test]
        public void VerifyDeleteNotePreviouslyInserted()
        {
            InsertNewNote(webDriver);
            IReadOnlyList<IWebElement> notes = webDriver.FindElements(By.CssSelector(".note-item"));
            var btnDelete = notes[notes.Count - 1].FindElement(By.Id("DeleteNote"));
            btnDelete.Click();

            Assert.AreEqual(webDriver.Url, Website);
        }

    }
}