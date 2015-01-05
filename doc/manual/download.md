# ``lfetool`` Command Manual


## ``download`` Command


The ``download`` command supports the following sub-commands:

* ``deps``


### ``download deps``


This command installs project dependencies defined in configuration:

```bash
$ lfetool download deps
```


#### Predicence

There are three potential locations for configuration, in order of decreasing
precidence:

* ``./lfe.config``
* ``~/.lfe/lfe.config``
* ``./rebar.config``

The case of the first two is handled by LFE utility configuration libraries.
Once finished processing those, work is handed off to ``rebar`` via the rebar
command ``rebar get-deps``.

If any dependencies are configured in the first two, and if these dependencies
are also declared in ``./rebar.config``, rebar will not be able to update them;
rebar will skip these, as they will already be present in the ``./deps/``
directory.


#### Configuration

The ``lfe.config`` files are configuration files in LFE syntax which are
available for per-project (i.e., ``./lfe.config``) or global
(i.e., ``~/.lfe/lfe.config``) configuration. As noted above, per-project
LFE configuration takes precedence over global LFE configuration (and global
takes precedence over per-project *rebar* configuration).

In the case of dependencies, here is an example that demonstrates the
supported configurations:

```cl
#(project (#(deps (#("rvirding/lfe" "master")
                   "lfex/lutil"
                   "lfex/ltest"))))
```

Use cases:

 * If you would like to use the pinned versions for project dependencies
   that ``lfetool`` sets up by default (known working combinations), then
   do nothing -- ``lfetool download deps`` will use ``rebar`` and the
   established behaviour you are used to will prevail.
 * If you would like to override one or more of the Github repos for a given
   project, then create an ``lfe.config`` file in your project directory
   and add a ``#(project (#(deps ...)))`` section.
 * If you would like to override *all* ``rebar`` versioned deps for all your
   LFE projects, (e.g., always getting LFE "master" or "develop"), then create
   an ``~/.lfe/lfe.config`` file and add a ``#(project (#(deps ...)))``
   section.


#### Background

By default, ``lfetool`` generates projects with pinned versions, projects
with versions that are known to work with each other. It does this by using
rebar, setting explicit version numbers in the ``deps`` section of
``rebar.config``.

Due to [this rebar bug](https://github.com/rebar/rebar/issues/170), that can
cause problems when one wants to override default versions. In fact, you can't
do it with rebar right now.

``lfetool download deps`` was developed as a work-around for this (see
[lfetool issue #135](https://github.com/lfe/lfetool/issues/135) and
[lutil issue #23](https://github.com/lfex/lutil/issues/23)).
