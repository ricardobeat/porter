porter
======

Porter is a package manager for private self-hosted repositories. It is language-agnostic - a package formula is merely a 
shell script utilizing a simple DSL. Packages can declare (unversioned) dependencies and request an install using Homebrew/Yum.

This is a work in progress.

TODO:
  - actually run it at least once
  - how to handle checksums? see npm
  - implement update notification mechanism
  - choose registry storage format
