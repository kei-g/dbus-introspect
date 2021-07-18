# dbus-introspector [![LICENSE](https://img.shields.io/github/license/kei-g/dbus-introspect?style=plastic)](https://opensource.org/licenses/BSD-3-Clause)

dbus-introspector - Bourne Shell Script to introspect DBus

## Usage

To show list of session bus,

```shell
dbus-list
```

or

```shell
dbus-list -w session
```

To show list of system bus,

```shell
dbus-list -w system
```

To introspect,

```shell
dbus-introspect -d destination -p path -w session|system
```
