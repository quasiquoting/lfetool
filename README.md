# lfetool

<a href="resources/images/logo-small.png" />

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
  * [Creating lfetool Plugins](#creating-lfetool-plugins-)


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
* dev-v2 - a convertion of lfetool from a large Bash script to an LFE project;
  the v2.x series (every release to stable gets merged into dev-v2, to benefit
  from any bug fixes/hot-fixes/template improvements/additions/etc.)
* master - this is kept around for legacy purposes (there are some projects
  still using the old v1.0.x series)


### Creating lfetool Plugins [&#x219F;](#table-of-contents)

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
