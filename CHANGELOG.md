# ChangeLog

The following are lists of the notable changes included with each release.
This is intended to help keep people informed about notable changes between
versions as well as provide a rough history.

#### Next Release

- Support Java

#### v0.0.39

- Include the .git directory in the project tar so gem specs can find the 
  dependency gems.

#### v0.0.38

- Fix issue with generating `.boxci.yml` incorrectly when no ruby version is
  found.

#### v0.0.37

- Re-enable cleanup
- Modified command success detection to rasie Boxci::CommandFailed error on
  failure so that it triggers cleanup and short-circuit.

#### v0.0.36

- Fixed command success detection so it actually works properly.

#### v0.0.35

- Added command success detection and debugging in hopes to better identify
  what is happening in external systems such as Bamboo.

#### v0.0.34

- Disable cleanup for testing purposes, will have to do manual cleanup until
  it is re-enabled.

#### v0.0.33

- Add `VAGRANT_LOG=debug` to `vagrant up` and `vagrant ssh-config` commands to
  assist with identifying issues. This is only the case if the verbose switch
  is set.
- Rename OpenStack hostnames to include boxci prefix instead of shanty prefix
  [\#33](https://github.com/reachlocal/boxci/issues/33)

#### v0.0.32

- It should now add dummy boxes for various providers.

#### v0.0.31

- Fix issue #31 so that it auto installs vagrant plugins without prompting the
  user. This will allow it to work in non-interactive environments like other
  CI systems (Bamboo, etc.)
- Fix issue #30 where exceptions were being swallowed and forcing an exit
  status 0 instead of displaying the exception and exiting non-zero.
- Added exporting of `BOXCI_TEST_RESULT` with the value being the exit code of
  the bulid. This allows it to be inspected in the `after_failure`,
  `after_success`, or `after_script` commands.
- Made `after_success`, `after_failure`, and `after_script` no longer affect
  the `boxci test` exit code.

#### v0.0.30

- Renamed project from `shanty` to `boxci`
- Moved all `TODO.txt` items to GitHub Issues
- Corrected author emails in the gemspec

#### v0.0.29

- Made Initializer not inherit from Thor
- Made Bulder not inherit from Thor
- Made Tester not inherit from Thor

#### v0.0.28

- Remove vagrant debugging from test subcommand cleanup

#### v0.0.27

- Included stderr on test subcomand cleanup logging

#### v0.0.26

- Added logging to the test subcommand cleanup

#### v0.0.25

- Moved workspace cleanup dir rm out of workspace folder block

#### v0.0.24

- Hid output of cleanup commands

#### v0.0.23

- Set SIGPIPE handler to `SIG_IGN`

#### v0.0.22

- Cleaned up hackish logging a bit

#### v0.0.21

- Switched rescue exception handling to StandardError

#### v0.0.20

- Added better exception logging

#### v0.0.19

- Added Errno::EPIPE swallowing in SIGTERM handler

#### v0.0.18

- Added rescue handler for cleanup in SIGTERM handler

#### v0.0.17

- Added Errno::EPIPE exception swallowing

#### v0.0.16

- Added Tester globalish exception logging

#### v0.0.15

- Fix few issues with the hack logging from `v0.0.14`

#### v0.0.14

- Added hack logging to verify signal handling

#### v0.0.13

- Added SIGPIPE swallowing to handle CI servers that kill stdout & stderr on
  build stop.

#### v0.0.12

- Remove top level exception handler

#### v0.0.11

- Wrapped test subcommand with unhandled exception handler

#### v0.0.10

- Added `--version` option to shanty

#### v0.0.9

- Added SIGTINT handler to run cleanup in test subcommand
- Added SIGTERM handler to run cleanup in test subcommand

#### v0.0.8

- Reworked init subcommand's provider option to match test subcommand
- Made it default to empty global config if not found
- Remove all the puts debugging added in v0.0.5 for Bamboo
- Add rake version constraint to gemspec

#### v0.0.7

- Made exceptino handler re-raise so thor exits when an exception happens

#### v0.0.6

- Added exception reporting around the initial config load in tester

#### v0.0.5

- Added puts around everything to see what was happening in Bamboo

#### v0.0.4

- Replaced test subcommand with puts to verify in Bamboo

#### v0.0.3

- Added thor exit on failure

#### v0.0.2

- Fixed bug where openstack node names had underscores
- Added artifact gathering and downloading
- Added `box_size` option to the `.shanty.yml`
- Fixed multiple script hook calls bug
- Made vagrant destroy forced so it doesn't prompt the user
- Fixed cd'ing issue before untar of code
- Bubble up exit code from test suite
- Added new test runner generator
- Added basic config permutations handling for rbenv
- Made virtualbox the default provider
- Added virtualbox support so can test things locally

#### v0.0.1

- Initial release
