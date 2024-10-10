+++
title = 'Aliasing "rm -i" Considered Harmful'
date = 2024-10-04T22:13:03-07:00
categories = [ 'unix/linux' ]
tags = [ 'shell', 'peeve' ]
+++

I always cringe when I see a user
--- or worse, a system default ---
that has a shell alias of `rm = 'rm -i'`.
Why? Because I consider this a very dangerous thing to do.
<!--more-->

*"But `rm -i` makes the `rm` command safer!"*, I hear you cry.
Well... *Sort of*...
You see,
it's not the use of the `-i` flag that I find dangerous
--- it's a useful option ---
or even giving `rm -i` an alias for easy usage;
it's the aliasing of it directly to `rm`
altering `rm`'s default behavior
that I find disturbing.

People who create such aliases
are trying to alleviate one of the inherent dangers of `rm`
that can best be summed up as follows:
*In Unix(Linux), 'rm' is forever*.
This adage ranks right up there with:
*Always assume the gun is loaded.*

With `rm`, there is no "trash can"
that you can you can fish you file back out of;
there is no "undelete" command to undo an errant file removal.
If you're lucky, you can go to your backups
and recover a hopefully recent enough copy of your file(s) from there.
(You *do* keep up-to-date backups, don't you?)
When using `rm` you should always be aware that you're playing with fire.

It's because of this inherent danger that `rm` has the `-i` option:
the *"Ask me if I really mean it"* option.
With this flag, `rm` will prompt the user
with the name of each file as it is about to be deleted,
and the user must respond with `y` or `yes`
(or really, anything beginning w/ the letter 'y')
for the deletion to actually occur.

So why *shouldn't* you alias `rm` to `rm -i`
so that it always asks you before deleting any file?
**Because that's not `rm`'s default behavior.**
If you have that alias in place,
you will use `rm` with less caution
because you know you have that `-i` safety net.
You become `rm` complacent.
Now: what happens when you sit down to a shell
**without** that alias set up?
Maybe you're setting up a new account?
Or helping a friend/co-worker with their account?
Or doing some sysadmin work w/in a root shell?
All of a sudden your safety net is gone,
but you're still blithely tossing `rm`s about
like parentheses in LISP code.
One slip and you can instantly
wreak widespread havoc
with nary a peep from `rm`.
You were so used to implicitly having the `-i` there
that you failed to use `rm` with the proper caution.

So, what can you do?
Do you have to forego the benefits of
an easy way to invoke `rm` with the `-i` flag?
Not entirely.
My suggestion is to create an alias such as `del = 'rm -i'`.
You can then freely use `del` as your "safe" `rm`.
But if you're ever in an environment without that alias,
and you accidentally enter `del * .o`
with an unintended space between the star and the ".o",
the shell will come back with "*`del: Command not found.`*",
rather than gladly deleting all the files in the current directory
as an unadorned `rm` would.
And seeing that error message, you will remember:
"*Oh yes. That's my own alias.
I'll have to use `rm` and be very careful.*"
(Or you could setup your `del` alias directly
in the current shell and use it until you exit.)

There are other limitations of `rm -i` as well.
For one, it gets very tedious to answer `yes` to each file
when you're deleting even a moderate number of files.
In fact, you may develop a habit of just anwering `yes` automatically
w/out carefully looking at what `rm` is saying it's actually going to delete.
(Do you *really* read all those EULA terms and conditions
before clicking "I Agree"?)
This rather defeats the whole purpose
of asking if you really meant to delete that file.
But that is neither here nor there regarding aliases to invoke `rm`,
which was my subject today.

So, if you want to create a shell alias for `rm -i` feel free to do so, 
but for heaven's sake, alias it to something other than `rm` itself.

