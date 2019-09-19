# secretsanta
A node script for Secret Santa.

## What is this ?

This simple node script will send a mail to your friends to tell them who they have to offer a present to this year for your Secret Santa.

## Wrapping up the presents

In order to run the script, you need [docker](https://www.docker.com/).

## Writing santa's letter

If you want a custom message, open `src/email.js` with your favourite editor, and replace the mail subjet and template with whatever you want.

Open `src/people.json`, and follow the template to add people.

If a person *A* does not want to be matched with another person *B*, add *B* to the `"not"` list of *A*.

Make sure every `"name"` is *unique*.

## Deliver the presents

In the directory, execute `make`, then `make start`, and insert your smtp address, your username and your password. You might have to temporarily enable *signin from insecure source* if you are using gmail.
