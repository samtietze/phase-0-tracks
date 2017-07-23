var colors = ["green", "chestnut", "piebald", "purple"];
var names = ["Green Beauty", "Mr Ed", "Sandwich", "Karl"];

function addColor(color, array) {
  array.push(color);
  return array;
}

console.log(addColor("chartreuse", colors));

function addName(name, array) {
  array.push(name);
  return array;
}

console.log(addName("Lenny", names));