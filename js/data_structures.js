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

// Commenting this out because it does not work. Overwrites the
// keys in the object rather than adding to the object.

// names.forEach(function(element, index) {
//   horseObject = {};
//   horseObject[element] = colors[index];
//   return horseObject;
// });

// console.log(horseObject);

addColor("super sparkle", colors);
addName("Harry Caray", names);
horseObject = {}
function makeObject(object, array1, array2) {
  for(i = 0; i <array1.length; i++) {
    object[array1[i]] = array2[i];
  }
  return object;
}
console.log(makeObject(horseObject, names, colors));