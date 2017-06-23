# Encrypt method
# Think about input that this method requires (string).
#   - We have to look at this string and loop through each letter (and then do something)
# Step 1: We need to change each letter of a string to the next letter of the alphabet.
#   - We are able to assume all input is lower-case, and all output too.
#   - If there's a space in the password, there should be a space in the output.
# Caution:
#   - When advancing "z" we need to not print out "aa", but chop off the second "a"


# Decrypt method
# Pretty much the opposite of the above.
# - We need to loop through the string, and find the previous letter of the alphabet.
# - The challenge is that there is no built-in method for going backwards.
#   - Create an alphabet string and then ask for the index of a particular letter and receive the index space of the previous letter.

# password = "camel"
def encrypt(password)
  alpha = "abcdefghijklmnopqrstuvwxyz"
  i = 0
  new_password = ""
  while i < password.length
    alpha_index = alpha.index(password[i]).next
    if alpha[alpha_index] == nil
      alpha[alpha_index] = "a"
    end
    new_password += alpha[alpha_index]
    i += 1
  end
  p new_password
end


def decrypt(password)
  alpha = "abcdefghijklmnopqrstuvwxyz"
  i = 0
  new_password = ""
  while i < password.length
    alpha_index = alpha.index(password[i]) - 1
    if alpha[alpha_index] == nil
      alpha[alpha_index] = "z"
    end
    new_password += alpha[alpha_index]
    i += 1
  end
  p new_password
end

# decrypt(encrypt("swordfish"))
# We had to futz about with the encrypt method's 'puts' command, but we weren't exactly sure why. Initially, Line 30: puts new_password resulted in an undefined method error on Line 38. We believe this is because the decrypt method was passed a variable rather than a string (we still aren't sure). However, when we used return or p on Line 30 to pass the result to the decrypt method, the nested call worked. P and return appear to have kept the quotation marks on the result, and that appears to allow the decrypt method's argument to function appropriately.

# User Interface!
# We should ask the user whether they want to encrypt or decrypt a password.
# There are a couple of possibilities. If the user wants to encrypt a password, then we run their input through the encrypt method.
#   If the user wants to decrypt a password, then we run their input through the decrypt method.
# Regardless of either decision, we need to print the result to the screen and end the program.

puts "Hello, Secret Agent X. Do you wish to encrypt or decrypt today?"
answer = gets.chomp
answer.downcase!

if answer.include?("encrypt")
  puts "Please enter the password you wish to encrypt."
  password = gets.chomp
  password.downcase!
  encrypt(password)
elsif answer.include?("decrypt")
  puts "Please enter the encrypted password you wish to decrypt."
  password = gets.chomp
  password.downcase!
  decrypt(password)
else
  puts "You are not actually Secret Agent X, are you?"
end