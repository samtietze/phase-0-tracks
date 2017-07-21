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


