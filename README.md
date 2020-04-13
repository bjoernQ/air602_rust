# Trying Rust on Air602 (based on the W600 SoC)

This is a first step to write Rust code running on [Air602](http://wiki.seeedstudio.com/Air602_WiFi_Development_Board/)

![Air602](https://github.com/SeeedDocument/Air602_WiFi_Module/raw/master/img/main.jpg)

The libraries in `air602/lib` are just compiled / copied from the [unofficial SDK](https://github.com/w600/sdk). You can certainly compile get them yourself.

The tools in `air602/bin` are also just copied from the inofficial SDK.

A first helpfull introduction I found (about the Air602 in general - not for Rust) [here](https://yoursunny.com/t/2018/Air602-blink/) besides the docs from Seeed Studio

This is for Windows but probably you can get it to work using the Python versions of the tools. Otherwise it uses the ARM-GCC toolchain.

# How to

Since the C libraries are precompiled it should be enough to just use `cargo xbuild` and flash the image via `flash.bat`

# Status

This is just an early, early first step! All it does is printing _Hello World_ once a second in an endless loop. You can check that with a terminal like HTerm.

# Notes

Probably you will have to change the COM port in `flash.bat` to flash the firmware.

Maybe you need to adapt the filename of GCC in `.cargo/config`

# Versions used

- cargo 1.41.0-nightly (8280633db 2019-11-11)
- rustc 1.41.0-nightly (412f43ac5 2019-11-24)
- arm-none-eabi-gcc.exe (GNU Tools for ARM Embedded Processors) 4.9.3 20141119 (release) [ARM/embedded-4_9-branch revision 218278]
Copyright (C) 2014 Free Software Foundation, Inc.

Using later versions _should_ not hurt - older ones maybe do.

# What's missing

That's a lot - to make this acutally useful at least Rust friendly wrappers for all the libraries are needed. Probably a bit more work since the FreeRTOS stuff is based a lot on macros and will require a C shim. There is a crate for that which apparently needs a more recent version of FreeRTOS than what is contained in the SDK.

Also the build process needs some improvements.
