# lfetool

<img src="resources/images/logo-small.png" />

*An Erlang Lisper's Tool for Admin Tasks, Project Creation, and Infrastructure*

## Table of Contents


* [Introduction](#introduction-)
* [Installation](#installation-)
  * [Stable](#stable-)
  * [Dev](#dev-)
  * [Both](#both-)
* [Usage](#usage-)
  * [lfetool Options](#lfetool-options-)
  * [lfetool Commands](#lfetool-commands-)
* [Development](#development-)
  * [Branches](#branches-)
  * [Howto](#howto-)
    * [Creating lfetool 1.x Plugins](#creating-lfetool-1x-plugins-)
* [The Future of ltetool](#the-future-of-ltetool-)
  * [The 2.x Series](#the-2x-series-)
  * [Separating CLI and Library](#separating-cli-and-library-)
  * [A Component Plan](#a-component-plan-)
  * [A Gentle Migration](#a-gentle-migration-)


## Introduction [&#x219F;](#table-of-contents)

Currently, the script supports these basic options:

* ``help`` or ``-h``
* ``version`` or ``-v``
* ``extract`` or ``-x``

And these commands:

* ``install``
* ``update``
* ``new``
* ``tests``
* ``repl``
* ``info``
* ``download``

Usage information for each of these is linked to below in the "Usage" section.


## Installation [&#x219F;](#table-of-contents)

### Stable [&#x219F;](#table-of-contents)

Download the [shell script](https://raw.github.com/lfe/lfetool/master/lfetool)
and save it to a directory in your ``$PATH``. For example:

```bash
$ curl -L -o ./lfetool https://raw.github.com/lfe/lfetool/stable/lfetool
$ bash lfetool install
```

### Dev [&#x219F;](#table-of-contents)

```bash
$ curl -L -o ./lfetool https://raw.github.com/lfe/lfetool/dev-v1/lfetool
$ bash lfetool install
```

### Both [&#x219F;](#table-of-contents)

This will install lfetool to ``/usr/local/bin``. Depending upon how the
permissions for your chossen path are setup, you may need to use ``sudo``.

If you installed with ``sudo`` but would like to be able to self-update the
script in the future, you should also change the ownership:

```bash
$ chown $USER /usr/local/bin/lfetool
```

To run ``lfetool`` more quickly, you can pre-extract the executable:

```bash
$ lfetool -x
```

This will be done for you eventually if you execute the ``lfetool repl``
command.


## Usage [&#x219F;](#table-of-contents)


### ``lfetool`` Options [&#x219F;](#table-of-contents)


``lfetool`` offer several command-line options/flags. The details are presented
on the "options" manual page:

* [Options](doc/manual/options.rst)


### ``lfetool`` Commands [&#x219F;](#table-of-contents)

Details on each of the commands listed below and the subcommands they offer
are linked to individual pages:

* [Install Command](doc/manual/install.rst)
* [Update Command](doc/manual/update.rst)
* [New Command](doc/manual/new.rst)
* [Tests Command](doc/manual/tests.rst)
* [REPL Command](doc/manual/repl.rst)
* [Info Command](doc/manual/info.rst)
* [Download Command](doc/manual/download.md)


## Development [&#x219F;](#table-of-contents)

### Branches [&#x219F;](#table-of-contents)

The following branches are used by this project:

* stable - what you should use for all your production needs; currently on
  v1.x; this is the default branch
* dev-v1 - on-going improvements to the v1.x series
* dev-v2 - a conversion of lfetool from a large Bash script to an LFE project;
  the v2.x series (every release to stable gets merged into dev-v2, to benefit
  from any bug fixes/hot-fixes/template improvements/additions/etc.)
* master - this is kept around for legacy purposes (there are some projects
  still using the old v1.0.x series)


### Howto [&#x219F;](#table-of-contents)

#### Creating lfetool 1.x Plugins [&#x219F;](#table-of-contents)

*Developing additional lfetool commands*

This section has been created for those that would like to submit patches/pull
requests to lfetool for bug fixes and/or new features. At the very least, it
should provide a means for understanding what is needed in order to add new
commands to lfetool.

Adding new commands to lfetool is as simple as creating a new plugin. One can
start by either copying an existing plugin that most closely resembles the sort
of plugin you want to create, or starting completely from scratch.

For those that wish to start from scratch, the following dev guide is
provided:

* [Create the Plugin](doc/dev-guide/01-create.rst)
* [Integrate the Plugin](doc/dev-guide/02-integrate.rst)
* [Documentation and Autocompletion](doc/dev-guide/03-docs.rst)
* [Testing the Plugin](doc/dev-guide/04-tests.rst)


## The Future of ltetool [&#x219F;](#table-of-contents)

### The 2.x Series [&#x219F;](#table-of-contents)

With the conversion from Bash to LFE as the codebase for ``lfetool``, the
plugin system will be changing. This is still up in the air:

* Originally lfetool 2.x was just going to be a complete rewrite in LFE, with
  its own LFE codebase.
* Later, Robert Virding expressed interest in bringing lfetool code into LFE
  propoer, perhaps as part of an effort to establish a stdlib for LFE. The
  biggest drive for this, however, was an interest in LFE not having any
  external dependencies, for users being able to perform all basic actions
  (compiling LFE code, running a REPL, generating projects, etc.) with
  pure LFE without having to download anything and without any complicated
  set up procedures.
* With the announcement of rebar3 and the vastly improved architecture that it
  offers over "classic rebar", there is now another option: building a series
  of rebar3 plugins that lfetool could then simply wrap.

This last option highlighted something of interest: as we work on a 2.x,
LFE-only solution (i.e., non-Bash), the dual issues of what is written and then
how it is used are completely separable and orthogonal. More on that in the
next section.


### Separating CLI and Library [&#x219F;](#table-of-contents)

The possibility of a changing CLI (or a CLI that was a moving target)
emphasized the point that we could create the LFE libraries that would support
an eventual lfetool 2.x now, without having to figure out how it will get used
later.

This has already started to happen:

 * The 1.5 release will have support for ``lfe.config`` files with the
   [download command](doc/manual/download.md). This uses a new lirbary,
   [lcfg](https://github.com/lfex/lcfg), that is in charge of all things
   ``lfe.config``.
 * The 2.x work that was being done on the new lfetool test runner is being
   moved over to the [ltest library](https://github.com/lfex/ltest/issues/8).
 * A [new repository](https://github.com/lfex/ltool) has been created to house
   the library code for lfetool itself!

If the lfetool LFE code (for the 2.x series) will be moving to a different
repo, then what is this repo for?

The short answer is the ``lfetool`` CLI. But we're not sure what exactly that
will be yet. Possibilities include:

 * **Part of Core LFE**: another script that sits next to ``bin/lfe``,
   ``bin/lfec``, and ``bin/lfescript`` whose primary responsibility would be the
   parsing of command line options to call the appropriate code (which would
   also have been moved into Core LFE).
 * **A stand-alone shell sciprt or lfescirpt**: it would perform the same
   functions as outlined in the previous bullet, just not as a part of Core LFE.
 * **A shell wrapper around rebar3**: this would required the creation of
   rebar3 plugins for every ``lfetool`` command. Those plugins would then call
   out to the various libraries previously created to house the inner logic of
   lfetool.


### A Component Plan [&#x219F;](#table-of-contents)

To give a better sense of this, the "architecture" of lfetool could look
something like this:

 * **CLI/User Interface**
   * help
   * command line options/arguements parsing
   * dispatching
 * **Supporting Libraries**
   * both LFE-specific (e.g., ltool, lcfg, and ltest),
   * as well as third-party (perhaps rebar3, mustache, etc.)
 * **Template Files**
   * text files amenable to variable substitution
   * could use erlydtl, mustache, etc.
 * **Plugin Management**
   * whether rebar3 is used or not, we will need to provide a clean and
     easy way to create new commands for lfetool


### A Gentle Migration [&#x219F;](#table-of-contents)

With the introduction of "bootstrapping" support for lcfg in
[issue #135](https://github.com/lfe/lfetool/issues/135) ("Working with versioned
deps can be a nightmare"), the lfetool 1.x series now has access to LFE
libraries (previously, only the lfetool 2.x series did). This means that we
don't have to wait for version 2.0 to land before we can take advantage of the
many benefits (principally maintainability) of using LFE (or even Erlang)
libraries in developing new features for lfetool.

Related to this, the following have been created:
 * [an lfetool-internals library]() - taken from the lfetool 2.x series
   * [lfetool ticket](https://github.com/lfe/lfetool/issues/156)
   * [ltool library ticket](https://github.com/lfex/ltool/issues/3)
 * migrations of 2.x series test-runner code to dedicated library
   * [ltool library ticket](https://github.com/lfex/ltool/issues/1)
 * [lcfg](https://github.com/lfex/lcfg) - for managing ``lfe.config`` files

With each new feature or change made to lfetool, even in the 1.x series, we
can start using the libraries mentioned above and more, migrating Bash to LFE
one function at a time.
