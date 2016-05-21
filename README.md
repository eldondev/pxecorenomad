### Nomad And Serf OEM packaging scripts for CoreOS PXE Boot

CoreOS is a great distro for the server environment because it is built for PXE
booting. This somewhat forces the issue on the whole pets-vs-cattle philosophy.

Serf is an exciting ad-hoc cluster management tool, because there are no
"special" nodes, there are automatic discovery features, and there is a very
generic query interface.

Nomad is great because it has a straightforward job configuration syntax, and
will re-schedule containers after failures.

I am working on a simple image that will automate deployment of this
environment to near-arbitrarily many machines in a plug-and-play way. The
current work will at least hopefully serve to introduce some of the folks at
the Atlanta Docker meetup to these new tools.

