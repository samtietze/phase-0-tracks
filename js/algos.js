// Release 0
// Write a function that takes an array of strings
// and returns the longest string from that array.
// Hint: .length method works in javascript.

// Function input: array of strings
// Function output: the longest string within the
// array.
// Possible solutions: LOOP through the array, and
// use a conditional.
// IF the first string is smaller than the next string
// move on to the next index.
// ELSE IF the first string is bigger than the next,
// compare the first string to the third item in the
// index and repeat with the modified IF statement.
// Bonus: evaluate multiple items if lengths are
// equivalent. Sounds like a headache.
var stringArray = ["this", "is", "this is a test", "testing", "okay"];

function longestString(array) {
  var anchor = array[0];

  for (i = 0; i < array.length; i++) {
    if (anchor.length < array[i].length) {
      anchor = array[i];
    // Rewriting the conditional to start out with
    // the variable being shifted to the next longest
    // item in the array. No more ELSE IF statement.
    }
  }
  return anchor;
}

console.log(longestString(stringArray));


var anchor = stringArray[0];
stringArray.forEach(function(string) {
  if (anchor.length < string.length) {
    anchor = string;
  }
});

console.log(anchor);

// Release 1
// Compare two objects together in order to check if
// they share at least one key-value pair.
// Since STRINGS and INTEGERS can be compared to each
// other and evaluate as true or false, it may be best
// to remove the element from the object to test it.
// However, in creating an array of the values in an
// object, it isn't _technically_ comparing the objects
// for having equivalent key-value pairs. So maybe not.

// Function input: two OBJECTS
// Function output: boolean true/false
// Steps: 1. Turn the key-value pairs into an ARRAY.
// 2. Match the KEYS with each other. IF the keys match
// then COMPARE the VALUES.

var object1 = {name: "Steven", age: 54};
var object2 = {name: "Tamir", age: 54};
function objectChecker(obj1, obj2) {
  var truthyness = false
  for (i = 0; i < Object.keys(obj1).length; i++) {
    if (Object.keys(obj1)[i] === Object.keys(obj2)[i]) {
      if (Object.values(obj1)[i] === Object.values(obj2)[i]) {
        truthyness = true;
      }
    }
  }
  return truthyness;
}

console.log(objectChecker(object1, object2));

var object3 = {animal: "Dog", legs: 4};
var object4 = {animal: "Dog", legs: 3};
console.log(objectChecker(object3, object4));

// Using the Array#forEach method to iterate through
// this problem:
function objectCheckerTwo(obj1, obj2) {
  var checker = false;
  Object.keys(obj1).forEach(function(i) {
    if (Object.keys(obj1)[i] === Object.keys(obj2)[i]) {
      if (Object.values(obj1)[i] === Object.values(obj2)[i]) {
        checker = true;
      }
    }
  });
  return checker;
}

console.log(objectCheckerTwo(object1, object2));