# `rvbatchutils`
Collection of drag-and-drop batch utilities for Your projects!
These are written _entirely_ in batch and that fact can be utilised to its fullest potential)

| Complexity |        Utility       | Short Description |
|------------|----------------------|-------------------|
| 1.         | `baumeister`         | Simple, but very customisable build system theoretically adaptable to any tooling. |
| 2.         | `administratosphere` | Basically `sudo` but Windows) |
| 3.         | `rvcommentcreator`   | A tiny tool for quickly creating header comments. May get more features in the future. |
| 4.         | `rvcmd`              | A batch script for launching a fancy CMD prompt. |

## Installing

`rvbatchutils` is now installable, but I'm still focusing this project to be copy-friendly. It's is just an optional convenience, especially for utils like `rvcmd`, which aren't something You'd normally use exclusively in a project and for reliability in general _(be weary of different versions though, since I'm not focusing on backward compatibility)_. All the installation helpers are located in `installer\`. It's expected that they are ran from a command prompt located at the aforementioned directory with administrator permissions.

_(tip: You may run `..\administratosphere` to automatically launch a new prompt in the same place with admin :D)_

- `setup.cmd`
  - Executes some preliminary steps required before deploying any actual utils. Run this first when installing.
  - As the first parameter, accepts an optional installation path, where all `rvbatchutils` will go. Path must have a `\` at the end. If not specified, `C:\RV\COMMONS\rvbatchutils\` will be used instead.
  - _(tip: if You are not happy with the directory You chose or You made an error, You can run the script again without fully uninstalling as long as You haven't installed any utils)_
- `util.cmd`
  - Installs the utility specified by the first argument _(required)_. For example: `util rvcmd` or `util rvcommentcreator`.
  - Second argument is passed to XCOPY, so that the user can imbue additional arguments, like `/Y` for evading confirmation prompt when updating utils.
- `unutil.cmd`
  - Deletes the utility specified by the first argument, similarly to `util`.
- `unins.cmd`
  - Completely removes `rvbatchutils` from Your system. Simply uninstalling all installed utils is not enough for a perfect cleanse like in `unins`.
  - _(tip: You can fully uninstall using this script without deleting any utils individually)_

> [!NOTE]
> _(If a util's name was updated, `unins-util` the old name in addition to installing the new one)_

## Postscript

You are motivated to look into all the code of this repository Yourself!

> [!CAUTION]
> And if an `rvbatchutil` program runs its own scripts, check those too, especially if You're in a foreign project.

#

### `baumeister`

<details><summary></summary>
<p>

A build system defined by a persistent CLI and procedures written by the user.

One of my main design pillars with this is that You must be able to build the project even without having `baumeister` itself, so if You're a fella who needs to work on somebody else's project without dealing with additional programs or manual builds, then just read the text below and You should be able to understand what to do:

Client-side interface is very self-explanatory _(plus I'll eventually add the help menu)_, so I'll focus on the project-side.

The only additional file You really need for `baumeister` is `baum_cfg.cmd`. It is ran when the program boots up. Technically You can do practically anything with it _(and I encourage experimentation)_, but it's mainly supposed to be a config file and with it You can set the _"Project Variables"_ to the ones that work for You. Here's a short description for each variable:

| Project Variable | Use |
|------------------|-----|
| `bau`            | What is executed when building. |
| `options`        | What is passed to `bau`. |
| `program`        | What is executed when running. |
| `arguments`      | What is passed to `program`. |

`baumeister` is made with `bau` scripts in mind: in place of the `bau` variable You may want to write a snippet of Batch to perform builds. Projects could have multiple `bau` scripts, like a release and a debug scripts. I strongly insist on sticking to the `bau_*` naming scheme, as it makes it clear what is a `bau` script.

As for `program`, it could be your output program, file or even script.

All of this could be seen in action in my `RVC` repository!

If it wasn't obvious already, please check the scripts You run if they're not Yours.

</p>
</details>

### `administratosphere`

<details><summary></summary>
<p>

`administratosphere` will open a separate command prompt in Your directory with administrator privileges, execute whatever command you've passed to it and subsequently close the interpreter.

To do so, it has to create a script called `administratosphere_script.cmd` that contains the necessary instructions. Due to limitations, it cannot be automatically deleted by itself, so I recommend running the `rvbatchutils` setup, so the utility keeps the script in `%RVBATCHUTILS-INSTALL-DIR%` instead of littering _(still, only one instance of `administratosphere` would be able to run at a time)_.

Tip: Use `PAUSE` to keep the window open for output inspection.

</p>
</details> 

### `rvcommentcreator`

<details><summary></summary>
<p>

A customisable script that will create a _"header"_ comment for use in code. Below You can see an example of what I mean by _"header"_:

```c
/***************************************** MAIN *****************************************/
```

Big comment with a label in the middle to signify a section of Your code, making it easier to read and allowing you to separate big chunks of code.

Importantly `rvcommentcreator` can create a few other types of comments, though as of now it's not explicitly designed to do so.

### Usage

To use `rvcommentcreator` You may utilise _"style scripts"_: they set variables used by the comment generation code to vary symbols in generated comments. That means You're free to adjust headers in the name of language syntax or personal beauty ideals. See how the variables are used below:

`%PREFIX%` `%BAR%%BAR%...%BAR%%BAR%` `%MIDPREFIX%` `label` `%MIDPOSTFIX%` `%BAR%%BAR%...%BAR%%BAR%` `%POSTFIX%`

The hardcoded, default style used in the absence of any project-specific style is showcased below, catered for the C programming language, by proxy for similar languages as well. It can serve as an example to build off of for Your own styles.

```cmd
SET "PREFIX=/*"
SET "BAR=*"
SET "POSTFIX=*/"

SET "MIDPREFIX=[ "
SET "MIDPOSTFIX= ]"

SET "COUNT=80"
```

The naming convention for clarity is `rvvccs_*.cmd`. `*` is, of course, Your freedom, while `rvccs` stands for _"RV Comment Creator Style"_.

To run the style scripts, You just pass them as an argument to `rvcommentcreator`. If such an argument isn't passed, the comment creator runs `rvccs_main.cmd`, and if that file doesn't exist, it just takes its default style found in the code instead _(tip: You can pass arguments to the style script by doing something akin to `rvcommentcreator "rvccs_yourstylehere.cmd yourargumentshere"`)_.

The `COUNT` parameter is used for the overall width of the comment in characters.

Using a style script, I've made labels for Batch as well and I currently use them in the codebase of `rvcommentcreator` itself!

```cmd
:::::::::::::::::::::::::::::::::::::::::: MAIN ::::::::::::::::::::::::::::::::::::::::::
```

### Restrictions

The parameters do have some restrictions on them:
1. `BAR` is always a single character long.
2. `PREFIX` and `POSTFIX` have to be the exact same size.
3. `MIDPREFIX` and `MIDPOSTFIX` have the same relation. ^
4. `COUNT` and `label` must have the same parity _(property of being even or odd)_.

Oh, and of course, common sense applies ^

Only the `4`th rule has any runtime burden. In cases against the rule there would be no way to centre the label in any way, since they would disagree on whether the centre would be in a character or between two of them.

### Additional Features

As a neat convenience feature, you are able to add the `-c` flag to request automatic copy of the generated comment into the clipboard.

</p>
</details> 

### `rvcmd`

<details><summary></summary>
<p>

Will launch a `cmd` while using the `prompt` command to add pretty colours into the mix. Beyond cosmetics, they have one practical use of helping to spot the start and end of command output.

The first argument is the directory You would like to open the new command prompt in instead of the currently active directory.

There aren't any restrictions on running `rvcmd` a very specific way, but it's intended to be ran without a prompt already as a parent, so instead of typing in an already opened `cmd` or You'll want to open it by double-clicking the script/its shortcut, through the `Win`+`R` Run Menu and typing it in the `Ctrl`+`L` address bar of Windows Explorer, though it should work perfectly fine in most scenarios, although with some mild inconveniences.

Tip: You can change the style of the command prompt by editing the script, specifically the argument passed to `prompt`, however it's important to note that such a method is destructive.

</p>
</details> 

#