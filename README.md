Kontomatik help kit
=====================

This kit is designed to get you up and running with <a href="https://developer.kontomatik.com/">Kontomatik API</a> in less than 1 minute.

The kit contains shell scripts which make it easier for the programmer to invoke API commands, by passing the required Http parameters to the _curl_ utility.

Requirements
------------

- A valid client id and apiKey. If you don't have them, ask for Test API access [here](http://kontomatik.com).
- A text editor, such as Vim.
- A Unix computer.

_You should also read the [Kontomatik API tutorial](http://developer.kontomatik.com/api-doc/#basic-api) to understand
  what is going on here._


Usage
--------

Let's say we want to call the <strong>default-import</strong> command: 

   - open a Terminal window and cd to the help-kit folder
   - edit index.html and set the <i>client</i> parameter to the value of your client id
   - write your apiKey to a file named "apiKey" 
         
                echo -n "78***********************************26" > apiKey

   - next, load index.html in your browser and login to a bank, using mock credentials "test" -> "Test123". If the login is successful, your browser will display session values, such as these:

                4328763 1195dd958bbeb3c207b36db5ab2be6f33576028c861c518fd6b615565ae63401

   - copy the values, switch back to the Terminal and execute default-import.sh, passing _sessionId_ and _sessionIdSignature_ to the script

                sh default-import.sh 4328763 1195dd958bbeb3c207b36db5ab2be6f33576028c861c518fd6b615565ae63401


You should now receive a 202 response from the service, in XML format. Note the command "id" attribute:

```xml
<?xml version="1.0" encoding="utf-8"?>
<reply status="202 Accepted">
    <command id="4328291" state="in_progress" name="DefaultImportCommand">
        <progress><value>0</value></progress>
    </command>
</reply>
```
Finally, execute poll.sh, passing the sessionId, sessionIdSignature and commandId parameters:

        sh poll.sh 4328763 1195dd958bbeb3c207b36db5ab2be6f33576028c861c518fd6b615565ae63401 4328291

You should now receive the final response of the default-import command.
