PowerGit
========

Manage, create, clone, pull, push multiple git repos from the command
line.

If you love git and work daily with multiple git repos (even hubs) then
you will really want to use some kind of power `git` utility commands
like these. I'm sure there are more out there. It was just faster to write
these than search.

Setup
=====

Make sure you have [ssh keys][] setup and grab the usual way:

```
cd ~
git clone http://github.com/robmuh/powergit.git
export PATH=$HOME/powergit/bin:$PATH
```

That just may be the only one you have to write out. The rest you can
put into a `giturls` file, usually `~/.giturls` or `~/config/giturls`:

```
git@github.com:robmuh/config.git
git@github.com:robmuh/bin.git
git@github.com:robmuh/vimfiles.git
git@github.com:robmuh/mdaddlinks.git
git@github.com:robmuh/fmt.git
git@github.com:robmuh/filters.git
git@github.com:trainemon/trainemon.git
git@github.com:blockhead-battles/blockhead-battles.git
git@github.com:robmuh/robmuh.github.io.git com
git@main:private/private.git
```

The second field is the directory in case you don't want the long
name, but you knew that:

```
git@github.com:robmuh/robmuh.github.io.git com
```

Put something like the following in your `bashrc`. (Here's [mine][] with
more stuff in it.)

```
export GITURLS=$HOME/config/giturls

gcd () {
  cd `gls $1 | perl -e '@m=split(/\s+/,<STDIN>);print$m[1]'`
}

```

Now you can grab all the rest with one command, but first let's make
sure we got them all right:

```
gping
```
OK, looks good:

```
---------------------- git@github.com:robmuh/config.git ----------------------
dc8d8145850dad35e27a98760bd552d98f556b3f	HEAD
----------------------- git@github.com:robmuh/bin.git ------------------------
581d2e5371a6f061aea8965042ee24d6fdb58d95	HEAD
--------------------- git@github.com:robmuh/vimfiles.git ---------------------
bb67c4d05af8d273fc863964b5ecb9b0e445e690	HEAD
-------------------- git@github.com:robmuh/mdaddlinks.git --------------------
4bd36c036947e7afc9791d4fae6df29e091e9041	HEAD
----------------------- git@github.com:robmuh/fmt.git ------------------------
7658ccae1f3434b385144510d06aeaef2e28b496	HEAD
--------------------- git@github.com:robmuh/filters.git ----------------------
b131133108e9c8b2655f4de49302e67bca5827e3	HEAD
----------------------- git@github.com:robmuh/note.git -----------------------
2b3fef7106ab99caacb217ae764e3f7b0e18b262	HEAD
----------------- git@github.com:robmuh/robmuh.github.io.git -----------------
8096e41b057f5b5a81352392e86e2a7defad652b	HEAD
------------------- git@github.com:trainemon/trainemon.git -------------------
b81b2c76fac466c48ec4a72b0f800453fe7af2e4	HEAD
----------- git@github.com:blockhead-battles/blockhead-battles.git -----------
9e64af0d9c6c47ec7a387649a61cf7282be879c4	HEAD
----------- git@main:private/private.git -----------
9999999999999999999999999999999999999999	HEAD
```
So can go ahead and clone them down:

```
gclone
```

The rest of the commands are pretty obvious:

* `save` - short for `git status; git add .; git commit ..., git push`
* `gsave` - same as `save`, but for all repos
* `gls` - lists all your repos
* `gls name` - lists all your repo names
* `gls url` - lists all your repo urls
* `gls dir` - lists all your repo directory full paths
* `gcd KEY` - changes to the first repo containing the `KEY` in name
* `gstatus` - `git status` on all repos
* `gpull` - `git pull` every repo listed in `$GITURLS` file
* `gpush` - `git push` every repo listed in `$GITURLS` file
* `gclone` - `git clone` every repo listed in `$GITURLS` file
* `gurls` - opens the `$GITURLS` file with your `$EDITOR`
* `gcmd CMD` - `cd` into each repo and execute `CMD`
* `gfor GITCMD` - `cd` into each repo and execute `git GITCMD`
* `gping` - `git -ls-remote REPO HEAD` on each `REPO`

Like I said, nothing fancy, just convenient. After using this I have
completely dropped [DropBox][] and other methods of saving files of any
type other than media. The tools particularly help when moving stuff
around between repos and reorganizing things.


FAQ
===

**Q: Did you know there is another `powergit` project?**

A: Yes, and I imagine there are a lot of them. Um, does anyone still use
powershell anymore? ;P

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

[DropBox]: http://dropbox.com
[mine]: https://github.com/robmuh/config/blob/master/bashrc
[ssh keys]: https://help.github.com/articles/generating-ssh-keys
