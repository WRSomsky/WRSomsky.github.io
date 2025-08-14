+++
pubdate = 2025-08-14T14:57:13-07:00
moddate = 2025-08-14T14:57:13-07:00
title = 'Avoiding Shell Bloat'
categories = [ "unix/linux", ]
tags = [ "sysadmin", "shell", ]
+++

There are many things that can be done
to customize and extend
the behavior of your command shell,
and modern Linux distros provide
a large number of these activated by default:
from handy aliases and colorized output settings
to command line completion and new command installation.

But what if you don't *want* all those extra settings/extensions?
What if you want to exert a finer control of such things yourself?
Here is a method of granting such control to you and your users
on a per-user, opt-in basis.

<!--more-->

## The Hook

When a standard Linux command shell starts,
it will first execute commands
  from certain system shell-setup files
    (`/etc/{profile,bashrc}` for the *bash* shell,
     `/etc/csh.{login,cshrc}` for the *tcsh* shell)
and then execute commands
  from the user's shell-setup files
    (`~/.{profile,bashrc}` or `~/.{login,cshrc}`)
before giving control to the user.
[Note: For brevity, I am eliding over details of
alternate names for these files and exactly how they are found/selected;
see the documentation of the *bash* and *tcsh* shells for the full details.
--WRS]

Classically, the settings done in these `/etc/` files
were mostly limited to essentials such as
setting the `umask` value and the command search `$PATH`.
Current linux distros, however, have
--- presumably in the name of user-friendliness ---
greatly expanded upon what is done in these shell-setup files
(including executing commands from additional files in `/etc/profile.d/`),
providing/activating things such as
colorized command output, shell command completion,
or even suggesting alternatives to or installation of unrecognized commands:
```
$ cat /etc/system-release
Rocky Linux release 9.6 (Blue Onyx)
$ catt
bash: catt: command not found...
Similar command is: 'cat'
$ bat
bash: bat: command not found...
Install package 'bat' to provide command 'bat'? [N/y] 
```

While this may be desired by/for most users,
there will be some users that desire a more classical approach.
And while it may be possible for these users to undo
all the settings and configurations done in the system shell-setup files,
it will be simpler to give them a method to avoid having them done at all.

## The Un-Hook

The method I have implemented for this on the systems I administer
is to add a line to the top of the system shell-setup files
to skip their setup actions on the presence of special trigger files
in the user's home directory.
Here is the line as added to `/etc/csh.login`,
triggering on the presence of a `$HOME/.login.noetc` file.
```
# /etc/csh.login

[ -f $HOME/.login.noetc ] && exit 0 # skip the rest if unwanted --WRS

[[ ... rest of file as distributed ... ]]
```
Similar lines are added to `/etc/{csh.cshrc,profile,bashrc}`,
triggering on `$HOME/.{cshrc,profile,bashrc}.noetc` respectively.

As these trigger files do not normally occur
w/out the user explicitly creatings them,
and the system shell-setup files behave as distributed w/out their presence,
these changes should not affect 'normal' users in any way.

If a (presumably experienced) user
_does_ wish to forgo the system setup files for their shell,
they merely have to create the appropriate trigger-file(s)
in their home directory, and all such setup will then be omitted.
In opting out of these setup actions, however,
the onus of making sure that any *required* setup is completed
(*e.g.* `umask`, `$PATH`, *etc.*)
falls on the user,
hence the presumption that this will only be attemped by experienced users.

