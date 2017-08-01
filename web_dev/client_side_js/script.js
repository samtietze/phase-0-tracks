console.log("The script is running!");

function hideImage() {
  var img = document.getElementById("bookimg");
  if (img.style.visibility === "hidden") {
    img.style.visibility = "visible";
  } else {
    img.style.visibility = "hidden";
  }
}