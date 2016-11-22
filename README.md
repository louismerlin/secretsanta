# secretsanta
A ruby script for Secret Santa.

## What is this ?

This simple ruby script will send a mail to your friends to tell them who they have to offer a present to this year for your Secret Santa.

## Wrapping up the presents

In order to run the script, you need [ruby](https://www.ruby-lang.org/en/).

When this is done, install the **gmail** gem with `gem install gmail`.

## Writing santa's letter

If you want a custom message, open *secretsanta.rb* with your favourite editor, and replace the mail subjet and template with whatever you want (even utf-8 characters !). You can find it in the last lines of the script.

Open *people.txt* with your favorite editor, and follow the template to add people. The format is, for every line :
```
Name email@anything.really
```
If someone does not want to be matched with another person, use this format (only on the last of the two !)
```
Romeo romeo@verona.it NOT Juliet
```

## Deliver the presents

in the directory, execute `ruby secretsanta.rb`, and insert your gmail username and password. You might have to temporarily enable *signin from insecure source* (you will receive a mail from google).
