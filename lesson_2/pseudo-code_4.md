Write out pseudo-code for a method that determines the index of the 3rd occurrence of a given character in a string. For instance, if the given character is `'x'` and the string is `'axbxcdxex'`, the method should return 6 (the index of the 3rd `'x'`). If the given character does not occur at least 3 times, return `nil`.

Casual Pseudo-code:
```
Given a string of characters,

Save the given character to a variable.
Split the given string into a collection of characters.

Iterate through the collection of characters one by one.
- Set the saved index as `nil`.
- Set the given character count as 0.
- For each iteration, compare the current character with the given character
- If the current character does not match the given character
  - Move to the next character in the collection
- Otherwise, if the current character matches the given character
  - Increment the given character count by 1
  - Check the given character count.
  - If the given character count is 3
    - Reassign the saved index to the index of the current character.
    - Exit the iteration.
  - Otherwise, if the given character count is less than 3
    - Move to the next character in the collection.

After iterating through the collection, return the value of the saved index.
```

Formal pseudo-code
```
START

# Given a string of characters called "string"

SET given_character = GET character from user
SET character_collection = string split into individual characters

SET iterator = 1
SET saved_index = nil
SET given_character_count = 0

WHILE iterator <= length of character_collection
  SET current_character = value within character_collection at space "iterator"
  IF current_character != given_character
    Go to the next iteration
  ELSE
    given_character_count = given_character_count + 1
    IF given_character_count == 3
      saved_index = index of element in character_collection at space "iterator"
    ELSE
      Go to next iteration

PRINT saved_index

END
```