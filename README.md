# bliplay WebAssembly

Contains a WebAssembly version of [bliplay](https://github.com/detomon/bliplay).

> ---
>
> WORK IN PROGRESS
>
> ---

## Demo

- [Bliplay editor](https://detomon.github.io/bliplay-wasm/)
- [Examples](https://detomon.github.io/bliplay-wasm/links.html) for URLs which directly contain the source code.

## Setup

Checkout the submodules:

```sh
git submodule update --init --recursive
```

Install emscripten:

```sh
$ brew install emscripten
```

Run the compiler command once to create the config file in `~/.emscripten`:

```sh
$ emcc
```

Edit `~/.emscripten` and make sure `LLVM_ROOT` points to the LLVM binaries inside the emscripten directory `/usr/local/Cellar/emscripten/1.37.25/libexec/llvm/bin` (version may change):

```
...
# this helps projects using emscripten find it
EMSCRIPTEN_ROOT = os.path.expanduser(os.getenv('EMSCRIPTEN', '/usr/local/Cellar/emscripten/1.37.25/libexec')) # directory
LLVM_ROOT = '/usr/local/Cellar/emscripten/1.38.11/libexec/llvm/bin'
BINARYEN_ROOT = os.path.expanduser(os.getenv('BINARYEN', '')) # if not set, we will use it from ports
...
```

## Build

Build `bliplay.js` and `bliplay.wasm`:

```sh
$ make
```

## Running

You can now run `index.html` on a local webserver. Opening it directly from the file system may not work.

## Some Articles

<https://medium.com/@eliamaino/calling-c-functions-from-javascript-with-emscripten-first-part-e99fb6eedb22>
<https://stackoverflow.com/questions/41875728/pass-a-javascript-array-as-argument-to-a-webassembly-function>
