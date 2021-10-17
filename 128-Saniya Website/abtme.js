//Function for To the Top button
var mybutton = document.getElementByClass("button");

function topFunction() {
  document.body.scrollTop = 0;
  document.documentElement.scrollTop = 0;
}

//Funtion for Contact Me form validation
function validateForm() {
  var x = document.forms["myForm"]["fname"].value;
  if (x == "") {
    alert("Name must be filled out");
    return false;
  }
}

//Display Books by AJAX
function getReceiptAjax(){
  var xhttp = new XMLHttpRequest();
  xhttp.onreadystatechange = function() {
    if (xhttp.readyState == 4 && xhttp.status == 200) {
      processReceipt(xhttp);
    }
  };
  xhttp.open("GET", "books.xml", true);
  xhttp.send();

  function processReceipt(xhttp){
    var xml = xhttp.responseXML;
    var itemArray = parseXML(xml);
    display(itemArray);
  }

  function parseXML(xml){
    var itemElements = xml.getElementsByTagName("Book");
    var itemArray = [];
    for(var i=0; i< itemElements.length; i++){
      var item = {};
      item.img = itemElements[i].getElementsByTagName("img")[0].childNodes[0].nodeValue;
      item.bookName = itemElements[i].getElementsByTagName("bookName")[0].childNodes[0].nodeValue;
      item.author = itemElements[i].getElementsByTagName("author")[0].childNodes[0].nodeValue;
      item.link = itemElements[i].getElementsByTagName("link")[0].childNodes[0].nodeValue;
      itemArray.push(item);
    }
    return itemArray;
  }

  function display(itemArray){
    var html = "<table align='center'>";
    html += "<table cellpadding ='10' border='1'>"
    html += "<tr>"
    html += "<th>" + "Book" + "</th>"
    html += "<th>" + "Name" + "</th>"
    html += "<th>" + "Author" + "</th>"
    html += "</tr>"
    for(var i=0; i<itemArray.length; i++){
      html+="<tr>"
      html+="<td>" + "<a target='_blank' href='"+itemArray[i].link+"'>"+ "<img src='"+itemArray[i].img+"' width='150' height='200'>" +"</a></td>"
      html+="<td>"+itemArray[i].bookName+"</td>"
      html+="<td>"+itemArray[i].author+"</td></tr>"
    }
    html += "</table>";

    var booksDiv = document.getElementById("books");
    booksDiv.innerHTML = html;
  }
}
