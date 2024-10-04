+++
draft = true
title = 'Aliasing "rm -i" Considered Harmful'
date = 2024-10-03T00:47:33-07:00
categories = [ 'linux' ]
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
that I find alarming.

People who create such aliases
are trying to alleviate one of the inherent dangers of `rm`
that can best be summed up as follows:
*In Unix(Linux) 'rm' is forever*.
This addage ranks right up there with:
*Always assume the gun is loaded.*

With `rm`, there is no "trash can"
that you can you can fish you file back out of;
there is no "undelete" command to undo an errant removal.
If you're lucky, you can go to your backups
and recover a hopefully recent enough copy of your file from there.
(You *do* keep your backups up to date, don't you?)
When using `rm` you should always be aware that you're playing with fire.

It's because of this inherent danger that `rm` has the `-i` option:
the *"Ask me if I really mean it"* option.
With this flag, `rm` will prompt the user
with the name of each file as it is about to be deleted,
and the user must respond with `y` or `yes`
(or really, anything beginning w/ the letter 'y')
for the deletion to actually occur.

... [[more]]

So, if you want to create a shell alias for `rm -i` feel free to do so, 
but for heaven's sake, alias it to something other than `rm` itself.

