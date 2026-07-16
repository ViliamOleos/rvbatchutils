# `rvbatchutils`
Collection of drag-and-drop batch utilities for Your projects!
These are written _entirely_ in batch and that fact can be utilised to its fullest potential)

| Complexity |       Utility      |     Status    | Short description |
|------------|--------------------|---------------|-------------------|
| 1.         | `baumeister`       | Early Version | Simple, but powerful and customisable persistent build system theoretically adaptable to any language and tooling. |
| 2.         | `rvcommentcreator` | Early Version | A tiny tool for quickly creating header comments. May get more features in the future. |
| 3.         | `coolcmd`          | `v1.2`        | A batch script for launching a fancy CMD prompt with some features of its own. |

## Installing

`rvbatchutils` is now installable, but I'm still focusing this project to be copy-friendly. It's is just an optional convenience, especially for utils like `coolcmd`, which aren't something You'd normally use in a project. All the installation helpers are located in `rvbatchutils-installer\`. It's expected that they are ran from a command prompt located at the aforementioned directory with administrator permissions.

_(tip: You may run `..\coolcmd\coolcmd -A` to automatically launch a new `cmd` in the same place with admin :D)_

- `setup-rvbatchutils.cmd`
  - Executes some preliminary steps required before installing any actual utils. Run this first when installing.
  - As the first parameter, accepts an optional installation path, where all `rvbatchutils` will go. Path must have a `\` at the end. If not specified, `C:\Program Files\rvbatchutils\` will be used instead.
  - _(tip: if You are not happy with the directory You chose or have made an error, You can run the script again without fully uninstalling as long as You haven't installed any utils)_
- `install-util.cmd`
  - Installs the utility specified by the first argument _(required)_. For example: `install-util coolcmd` or `install-util rvcommentcreator`.
  - Second argument is passed to XCOPY, so that the user can add additional arguments, mainly `/Y` for evading confirmation prompt when updating utils.
- `unins-util.cmd`
  - Deletes the utility specified by the first argument, similarly to `install-util.cmd`.
- `unins-rvbatchutils.cmd`
  - Completely removes `rvbatchutils` from Your system. Simply uninstalling all installed utils is not enough.
  - _(tip: You can fully uninstall using this script without deleting any utils individually)_

> [!CAUTION]
> Utils with dashes _(`-`)_ in their names are imperatively not intended for installation, so in simple words You can't install the installer as a util.
> If You did install it, I highly recommend fully uninstalling and reinstalling `rvbatchutils`.

## Postscript

You are motivated to look into all the code of this repository Yourself! That is one of the several good aspects to writing in batch.

#

### `baumeister`

<details><summary></summary>
<p>

A build system defined by a persistent CLI and procedures written by the user.

Client-side interface is very self-explanatory _(plus I'll eventually add the help menu)_, so I'll focus on the project-side.

The only additional file You really need for `baumeister` is `baum_cfg.cmd`. It is ran when the program boots up. Technically You can do practically anything with it _(and I encourage experimentation)_, but it's mainly supposed to be a config file and with it You can set the _"Project Variables"_ to the ones that work for You. Here's a short description for each variable:

| Project Variable | Use |
|------------------|-----|
| `bau`            | What is ran when building. |
| `options`        | What is passed to `bau`. |
| `program`        | What is ran when running. |
| `arguments`      | What is passed to `program`. |

`baumeister` is made with `bau` scripts in mind: in place of the `bau` variable You can write a snippet of Batch to perform builds. Projects could have multiple `bau` scripts, like a release and a debug scripts. I strongly insist on sticking to the `bau_*` naming scheme, as it makes it clear what is a `bau` script.

All of this could be seen in action in my `RVC` repository!

If it wasn't obvious already, please check the scripts You run if they're not Yours.

</p>
</details>

### `rvcommentcreator`

<details><summary></summary>
<p>

A customisable script that will create a _"header"_ comment for use in code. Below You can see an example of what I mean by _"header"_:

```c
/***************************************** MAIN *****************************************/
```

It's a big comment with a label in the middle to signify a specific section of Your code, making it easier to read and allowing you to separate things that really _do_ need to be separated.

And there are still a few more things that `rvcommentcreator` cam do.

### Usage

The current version in the repository requires You to copy the script to Your project and change the parameters inside of it _(duplicate it for multiple presets)_. I _may_ make it independent in the future, but for now, that's how we work.

Below You can see an example preset _(works for the C Programming language)_:

```cmd
SET "PREFIX=/*"
SET "BAR=~"
SET "POSTFIX=*/"

SET "MIDPREFIX=[ "
SET "MIDPOSTFIX= ]"

SET "COUNT=80"
```

You are free to change them however You want, where the final comment is constructed like this:

`%PREFIX%` `%BAR%%BAR%%BAR%...%BAR%%BAR%%BAR%` `%MIDPREFIX%` `label` `%MIDPOSTFIX%` `%BAR%%BAR%%BAR%...%BAR%%BAR%%BAR%` `%POSTFIX%`

The `COUNT` parameter is used for the overall width of the comment in characters.

Through parameter changes, You can stylise Your comments to be Your own and adapt them to almost any programming language, which is easy to see in this batch example:

```cmd
:::::::::::::::::::::::::::::::::::::::::: MAIN ::::::::::::::::::::::::::::::::::::::::::
```

After all of it, generating is as easy as running the script at any time and inputting the label You want to be displayed in the middle of the comment.

### Restrictions

The parameters _do_ have some restrictions on them, though.
1. `BAR` is always a single character long.
2. `PREFIX` and `POSTFIX` have to be the exact same size.
3. `MIDPREFIX` and `MIDPOSTFIX` have the same relation as in restriction `1`.
4. `COUNT` and `label` must have the same parity _(property of being even or odd)_.

Oh, and of course, common sense applies ^

Only the `4`th rule has any runtime burden. In cases against the rule there would be no way to centre the label in any way, since they would disagree on whether the centre would be a character or between characters.

### Additional Features

Beyond what You have seen above in the text, I've recently added the `-c` flag feature that will automatically copy the generated comment into the clipboard for You if passed to the program. 

</p>
</details> 

### `coolcmd`

<details><summary></summary>
<p>

This will launch a `cmd` while using the `prompt` command to add pretty colours into the mix. That _does_ have practical uses, like more clearly where command outputs start and end.

Currently `coolcmd` isn't too customizable, but it would be great to expand its feature set in the future.

In the first argument, You can pass `-A` to make the script automatically launch the `cmd` with Administrator priviliges. Not only does it do that, but it ensures that the Admin CMD is launched in the directory You've actually launched it in, so its functionally better than regular `cmd` too!
<details><summary>Additional</summary>
<p>

> _Technically You have `-R`, which is used internally to request an elevated `coolcmd` to use the saved original directory. This will grab the `RVBATCHUTILS-COOLCMD-ADMINPATH` global environment variable for this user and navigate to the directory specified there._

</p>
</details> 

There aren't any restrictions on running this a very specific way, but it's intended to be ran without a prompt already as a parent, so instead of typing in an already opened `cmd` or `powershell` You'll want to open it by double-clicking the script or its shortcut, through the `Win`+`R` Run Menu, typing it in the `Ctrl`+`L` address bar of Windows Explorer, though it _should_ work perfectly fine in most scenarios with some mild inconveniences.

</p>
</details> 

#