# ContaScript

**Given the folder path, search in it and in any sub-folders for all scripts and count the occurrences of shabangs.**

 To find the script files, you can run the command [find](https://man7.org/linux/man-pages/man1/find.1.html) which returns the list of all files at the path passed as parameter.
 Using the *-exec* flag, it is possible to reprocess the result of the primitive.

 Looping on the list using the command [file](https://man7.org/linux/man-pages/man1/file.1.html) with the flags:
 <ul>
  <li><em>-b</em> : does not prepend the name in the output, </li>
  <li><em>--mime</em> : prints a very short text on the file type description, </li>
 </ul>
 it is possible to compare the description with the regex string that requires the type to be an executable script because of the 'x'.

 If, for example, the command:

 <code> file -b --mime contaScript.sh </code>

 It will result in: **"text/x-shellscript; charset=utf-8"**

 I read from each first line the shabang and write it into occurences.txt (temporary file).
 Sorting the temporary file alphabetically (sort) and counting the occurrences of the individual shebangs leads to the result.
