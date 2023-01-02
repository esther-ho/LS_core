=begin
--- P
Inputs:
- Prompt user for:
  - A noun
  - A verb
  - An adjective
  - An adverb
Outputs:
- Mad lib story using the user prompts
  - Template that inserts user's inputs in the story
Implicit rules:
- Each input should only be a single word
- Input should not contain punctuation or whitespace
- Inputs are not printed in order they are given
--- E
Enter a noun: dog
Enter a verb: walk
Enter an adjective: blue
Enter an adverb: quickly

Do you walk your blue dog quickly? That's hilarious!
--- D
- Use a array to store prompts
- Use a hash to store:
  - Prompts as keys
  - User inputs as values
--- A
- Create an array of prompts
- Initialize an empty hash
- Iterate through the array of prompts
- For each iteration,
  - Print the prompt
  - Get the user input
  - Check if input is valid
    - Input should contain only letters without whitespace and punctuation
  - If input is valid,
    - Add prompt and user input as key-value pair to hash
  - Else, if input is not valid
    - Prompt again
- Create a template story
- Print template story
=end
