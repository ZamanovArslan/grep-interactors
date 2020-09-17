# Grep-organizer (didn't found more suitable name)

Gem, which helps realize grep through organized Interactors.
For example, if sent interactor as ARG contains calling of other interactors, it will try to find entries in them.
More in spec/

## How to run
### Terminal app
```bash
$ ruby terminal_app interactors_path file_path keyword
```
eg
```bash
$ ruby terminal_app.rb /home/stanislav_lemm/Projects/solaris/app/interactors/ /home/stanislav_lemm/Projects/solaris/app/interactors/agreements/create.rb agreement
```
_Works only with absolute path for now_
### As gem
WIP