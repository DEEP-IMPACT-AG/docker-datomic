# Datomic Pro Starter

This Dockerfile defines a base image for Datomic Pro Starter Edition.
It builds a custom docker image so that configuration and data are external
and mounted via volumes.

Define the env vars `DATOMIC_USER_NAME` and `DATOMIC_PASS` if you intend to
use the `build.sh` script.

The Dockerfile **EXPOSES** ports 4334, 4335, 4336 and establises a **VOLUME**
at `/opt/datomic/data` and a **VOLUME** at `/opt/datomic/config`.

## License

The MIT License (MIT)

Copyright (c) 2014-2015 Point Slope, LLC.
Copyright (c) 2016 Deep Impact AG.

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.
