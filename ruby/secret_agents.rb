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

password = "camel"
def encrypt(password)
  alpha = "abcdefghijklmnopqrstuvwxyz"
  i = 0
  new_password = ""
  while i < password.length
    alpha_index = alpha.index(password[i]).next
    if alpha[alpha_index] == nil
      alpha[alpha_index] = "a"
    end
    # puts alpha_index
    new_password += alpha[alpha_index]
    i += 1
  end
  puts new_password
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
    # puts alpha_index
    new_password += alpha[alpha_index]
    i += 1
  end
  puts new_password
end

decrypt(password)