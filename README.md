PowerGit
========

If you love git and work daily with multiple git repos (even hubs)
then you will really want to use this set of PowerGit utility commands.
Just pull down the repo and add this `powergit/bin` to your `$PATH`.

Manage, create, clone, pull, push multiple git repos from the command
line. If you aren't using this (or something like it) you are wasting
time.

More docs later. Read the source for now. Easy stuff.

FAQ
===

**Q: Did you know there is another `powergit` project?**

A: Yes, and I imagine there are a lot of them. They suck---especially the
one about powershell. Does anyone still use powershell anymore? ;P

**Q: Aren't you afraid a command like 'save' will conflict?**

A: No. There is no other 'save' in my world (nor in many other power
users world). Git reigns.

**Q: What about the overly simplistic 'save' comment and all the
commits?**

A: If you have a special save make sure you add a comment. Both the
'gsave' and 'save' commands take one. In fact, this allows you to make
ONE comment on multiple repo commits *at the same time from one
command*.

**Q: Why isn't there a `gcreate` or `ginit`?**

A: There was. Then I deleted it. In order for `git push -u origin
master` to work you have to first have a repo there. It's just easier
to create it on your hub of choice and `gclone` (after adding to
`.giturls` or `git clone` it down.

**Q: Why not just use `bash` functions and aliases?**

A: Fair question. Bash functions would be faster for sure. Mostly
because I don't always have the luxury of using Bash, but strangely
I usually find Perl on older and more edge-case OSes (AIX, Sun, HP-UX)
