// Write a method that takes in a string and outputs its reverse.
// input: a string
// steps: could loop through this string and revise characters that way.
// Could also create a blank string and feed characters into it.
// For each character in the input string, we
// need to put its last characters into the new
// string.
// output: reverse that string
var str = "hello";
function reverse(string) {
  var reverseString = ""
  for (i = string.length - 1; i >= 0; i--) {
    reverseString += string.charAt(i);
    console.log(reverseString);
  }
}
reverse(str);

function alsoReverse(string) {
  var finalString = string.split("").reverse().join("");
  return finalString;
}
console.log(alsoReverse(str));


var storedString = reverse("First");
storedString;
var alsoStored = alsoReverse("Second");
console.log(alsoStored);

if (1 == 1) {
  console.log(alsoStored);
}