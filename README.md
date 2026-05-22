# rvbatchutils
Collection of drag-and-drop batch utilities for Your projects!
These are written _entirely_ in batch and that fact can be utilised to its fullest potential)

Currently contains **3** utilities, You can see them listed here:
| Complexity |       Utility      |     Status    | Short description |
|------------|--------------------|---------------|-------------------|
| 1.         | `baumeister`       | Mostly WIP    | Simple, but powerful and customisable persistent build system adaptable to any language and tooling. |
| 2.         | `rvcommentcreator` | Early Version | A tiny tool for quickly creating header comments. May get more features in the future. |
| 3.         | `coolcmd`          | `v1.2`        | A batch script for launching a fancy CMD prompt with some features of its own. |

> [!NOTE]
> This repository still needs much work.

#

### `baumeister`

<details><summary></summary>
<p>

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

Below You can see all of the default parameters _(preset for the C programming language)_:

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

This will launch a `cmd` and will use the `prompt` command to add pretty colours into the mix. That _does_ have practical uses, like seeing where command outputs start and end.

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